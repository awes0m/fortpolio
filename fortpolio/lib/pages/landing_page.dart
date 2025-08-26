import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/gallery_provider.dart';
import '../widgets/walkman_album.dart';
import '../models/gallery_item.dart';
import '../utils/web_actions.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  // INTERACTION: If app => open external link; if painting => go to detail route.
  void _onItemSelected(BuildContext context, GalleryItem item) {
    if (item.type == GalleryItemType.app) {
      openInNewTab(item.link);
    } else {
      Navigator.of(context).pushNamed('/painting/${item.id}');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(filteredGalleryProvider);
    final filter = ref.watch(galleryFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Som Home-A Creative Gully'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<GalleryFilter>(
                value: filter,
                alignment: Alignment.center,
                onChanged: (value) {
                  if (value != null) {
                    ref.read(galleryFilterProvider.notifier).state = value;
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: GalleryFilter.both,
                    child: Text('Both'),
                  ),
                  DropdownMenuItem(
                    value: GalleryFilter.app,
                    child: Text('Apps'),
                  ),
                  DropdownMenuItem(
                    value: GalleryFilter.painting,
                    child: Text('Paintings'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Subtle backdrop gradient to enhance depth
          const _Backdrop(),
          // Centered Walkman-style album
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive width max bound
                final maxWidth = constraints.maxWidth.clamp(320.0, 1600.0);
                return SizedBox(
                  width: maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 24,
                    ),
                    child: items.isEmpty
                        ? const _EmptyState()
                        : WalkmanAlbum(
                            items: items,
                            onItemTap: (item) => _onItemSelected(context, item),
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.inbox_outlined, size: 40, color: Colors.white38),
          SizedBox(height: 8),
          Text(
            'No items for this filter',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.2),
          radius: 1.0,
          colors: [Color(0xFF111317), Color(0xFF0C0D10)],
        ),
      ),
    );
  }
}
