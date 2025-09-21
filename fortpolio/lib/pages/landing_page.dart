import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/gallery_provider.dart';
import '../utils/utils.dart';
import '../widgets/walkman_album.dart';
import '../models/gallery_item.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  // INTERACTION: If app => go to app detail; if painting => go to detail route.
  void _onItemSelected(BuildContext context, GalleryItem item) {
    if (item.type == GalleryItemType.app) {
      Navigator.of(context).pushNamed('/app/${item.id}');
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appLogoCircle,
            SizedBox(width: 12),
            const Text(
              'Som Home- A Creative Gully',
              style: TextStyle(fontSize: 24, fontFamily: 'Pacifico'),
            ),
          ],
        ),
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
          // Centered Walkman-style album or mobile grid
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive width max bound
                final maxWidth = constraints.maxWidth.clamp(320.0, 1600.0);
                if (maxWidth < 600) {
                  // Mobile: Grid layout
                  return _MobileGrid(
                    items: items,
                    onItemTap: (item) => _onItemSelected(context, item),
                  );
                } else {
                  // Desktop: Walkman carousel
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
                              onItemTap: (item) =>
                                  _onItemSelected(context, item),
                            ),
                    ),
                  );
                }
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

class _MobileGrid extends StatelessWidget {
  final List<GalleryItem> items;
  final void Function(GalleryItem) onItemTap;

  const _MobileGrid({required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: items.isEmpty
          ? const _EmptyState()
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _GridItem(item: item, onTap: () => onItemTap(item));
              },
            ),
    );
  }
}

class _GridItem extends StatefulWidget {
  final GalleryItem item;
  final VoidCallback onTap;

  const _GridItem({required this.item, required this.onTap});

  @override
  State<_GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<_GridItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      widget.item.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stack) {
                        return Container(
                          color: Colors.grey.shade900,
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.white70,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _TypeBadge(type: widget.item.type),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final GalleryItemType type;

  const _TypeBadge({required this.type});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isPainting = type == GalleryItemType.painting;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isPainting ? colors.primary : colors.secondary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        isPainting ? 'Painting' : 'App',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
