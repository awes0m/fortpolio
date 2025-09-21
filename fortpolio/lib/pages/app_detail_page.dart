import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;

import '../providers/gallery_provider.dart';
import '../utils/web_actions.dart';

class AppDetailPage extends ConsumerWidget {
  final String itemId;
  const AppDetailPage({super.key, required this.itemId});

  Future<String> _fetchMarkdown(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load markdown');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(galleryItemByIdProvider(itemId));

    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('App')),
        body: const Center(child: Text('App not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          // OPEN APP: Uses AnchorElement from dart:html (web-only)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.launch),
              label: const Text('Open App'),
              onPressed: () {
                openInNewTab(item.link);
              },
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Show the image in full width with aspect constraint
          final horizontalPadding = constraints.maxWidth < 600 ? 8.0 : 24.0;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 4.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                          // Smooth fade for better UX
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  if (item.markdownUrl != null) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Details',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FutureBuilder<String>(
                      future: _fetchMarkdown(item.markdownUrl!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error loading details: ${snapshot.error}',
                            ),
                          );
                        } else {
                          return MarkdownBody(
                            data: snapshot.data!,
                            styleSheet: MarkdownStyleSheet.fromTheme(
                              Theme.of(context),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
