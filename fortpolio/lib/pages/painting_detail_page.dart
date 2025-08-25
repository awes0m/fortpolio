import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/gallery_provider.dart';
import '../utils/web_actions.dart';

class PaintingDetailPage extends ConsumerWidget {
  final String itemId;
  const PaintingDetailPage({super.key, required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(galleryItemByIdProvider(itemId));

    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Painting')),
        body: const Center(child: Text('Painting not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          // DOWNLOAD: Uses AnchorElement from dart:html (web-only)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.download),
              label: const Text('Download'),
              onPressed: () {
                downloadFromUrl(
                  url: item.link,
                  suggestedFileName: '${item.title}.jpg',
                );
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
                          item.link,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
