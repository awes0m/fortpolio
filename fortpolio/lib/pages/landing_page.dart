import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/gallery_provider.dart';
import '../utils/utils.dart';
import '../widgets/walkman_album.dart';
import '../models/gallery_item.dart';

// Tracks whether the orientation tip banner has been dismissed by the user
final orientationTipDismissedProvider = StateProvider<bool>((ref) => false);

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

    // Orientation and size info
    final media = MediaQuery.of(context);
    final isPortrait = media.orientation == Orientation.portrait;
    final isNarrow = media.size.width < 600; // treat as mobile width

    final tipDismissed = ref.watch(orientationTipDismissedProvider);

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

          // Orientation tip banner (mobile portrait only)
          if (isNarrow && isPortrait && !tipDismissed)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _OrientationTipBanner(
                  onDismiss: () =>
                      ref.read(orientationTipDismissedProvider.notifier).state =
                          true,
                ),
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

/// Top-of-screen, dismissible banner recommending landscape on mobile portrait
class _OrientationTipBanner extends StatelessWidget {
  final VoidCallback onDismiss;
  const _OrientationTipBanner({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: colors.inverseSurface.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            const Icon(
              Icons.screen_rotation,
              size: 20,
              color: Colors.deepOrange,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'For a better experience, please rotate your phone to Landscape mode.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Colors.orangeAccent.withValues(alpha: 0.5),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
            IconButton(
              tooltip: 'Dismiss',
              icon: const Icon(
                Icons.close,
                size: 18,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              onPressed: onDismiss,
            ),
          ],
        ),
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
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 800,
                childAspectRatio: .9,
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
