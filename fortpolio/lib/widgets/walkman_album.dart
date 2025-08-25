import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gallery_item.dart';

/// WalkmanAlbum
/// - Displays items as a horizontally scrollable "floating album" carousel
/// - Center item pops forward, sides tilt away
/// - Desktop: hover adds scale + shadow; Mobile: tap feedback
class WalkmanAlbum extends ConsumerStatefulWidget {
  final List<GalleryItem> items;
  final void Function(GalleryItem) onItemTap;

  const WalkmanAlbum({super.key, required this.items, required this.onItemTap});

  @override
  ConsumerState<WalkmanAlbum> createState() => _WalkmanAlbumState();
}

class _WalkmanAlbumState extends ConsumerState<WalkmanAlbum> {
  late PageController _controller;
  double _page = 0.0; // Current scroll position
  int? _hoveredIndex; // For desktop hover animations

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.65);
    _controller.addListener(() {
      setState(() {
        _page = _controller.page ?? _controller.initialPage.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _responsiveViewportFraction(double width) {
    if (width < 500) return 0.9;
    if (width < 900) return 0.75;
    if (width < 1300) return 0.65;
    return 0.55;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust viewport fraction based on width to keep the layout responsive
        final vf = _responsiveViewportFraction(constraints.maxWidth);
        if (_controller.viewportFraction != vf) {
          final currentPage = _controller.hasClients
              ? _controller.page?.round() ?? 0
              : 0;
          _controller.dispose();
          _controller =
              PageController(initialPage: currentPage, viewportFraction: vf)
                ..addListener(() {
                  setState(() {
                    _page =
                        _controller.page ?? _controller.initialPage.toDouble();
                  });
                });
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _cardHeightFor(constraints.maxWidth),
              child: PageView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return _WalkmanCard(
                    item: item,
                    index: index,
                    page: _page,
                    hovered: _hoveredIndex == index,
                    onHoverChanged: (isHover) {
                      setState(() => _hoveredIndex = isHover ? index : null);
                    },
                    onTap: () => widget.onItemTap(item),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            _DotsIndicator(
              count: widget.items.length,
              current: (_page).round().clamp(0, widget.items.length - 1),
            ),
          ],
        );
      },
    );
  }

  double _cardHeightFor(double width) {
    if (width < 500) return 320;
    if (width < 900) return 380;
    if (width < 1300) return 440;
    return 520;
  }
}

class _WalkmanCard extends StatelessWidget {
  final GalleryItem item;
  final int index;
  final double page;
  final bool hovered;
  final ValueChanged<bool> onHoverChanged;
  final VoidCallback onTap;

  const _WalkmanCard({
    required this.item,
    required this.index,
    required this.page,
    required this.hovered,
    required this.onHoverChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final delta = index - page; // distance from center
    final distance = delta.abs();

    // Tilt angle: side cards tilt away, center is flat
    final maxTilt = 0.35; // radians (~20 degrees)
    final tilt =
        (1 - distance).clamp(0.0, 1.0) * maxTilt * (delta < 0 ? 1 : -1);

    // Scale: center card is bigger
    final minScale = 0.85;
    final scale = minScale + (1 - distance).clamp(0.0, 1.0) * (1.0 - minScale);

    // Elevation/shadow intensity
    final elevation = 8.0 + (1 - distance).clamp(0.0, 1.0) * 16.0;

    // Hover adds a touch more scale/shadow on desktop
    final hoverScale = hovered ? 1.04 : 1.0;

    // A subtle 3D perspective to sell the "floating" effect
    final matrix = Matrix4.identity()
      ..setEntry(3, 2, 0.001) // perspective
      ..rotateY(tilt);

    final borderRadius = BorderRadius.circular(16);

    return Center(
      child: MouseRegion(
        onEnter: (_) => onHoverChanged(true),
        onExit: (_) => onHoverChanged(false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            transform: matrix,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: scale * hoverScale,
              curve: Curves.easeOut,
              child: PhysicalModel(
                color: Colors.black,
                clipBehavior: Clip.antiAlias,
                borderRadius: borderRadius,
                elevation: elevation,
                shadowColor: Colors.black.withOpacity(0.6),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _HeroImage(item: item),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 110,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black54],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 12,
                      child: Row(
                        children: [
                          _TypeBadge(type: item.type),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  final GalleryItem item;
  const _HeroImage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      item.imageUrl,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stack) {
        return Container(
          color: Colors.grey.shade900,
          alignment: Alignment.center,
          child: const Icon(
            Icons.broken_image,
            size: 48,
            color: Colors.white70,
          ),
        );
      },
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

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int current;
  const _DotsIndicator({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    final inactive = Colors.white24;
    final active = Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 18 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? active : inactive,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
