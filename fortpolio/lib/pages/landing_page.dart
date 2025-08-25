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
    final items = ref.watch(galleryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Walkman Gallery'), centerTitle: true),
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
                    child: WalkmanAlbum(
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
