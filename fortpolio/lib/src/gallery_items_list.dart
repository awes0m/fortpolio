// PROVIDER: Single source of truth for gallery items.
// Using a simple Provider<List<GalleryItem>> so it’s easy to swap with an async API later.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fortpolio/models/gallery_item.dart';

final galleryProvider = Provider<List<GalleryItem>>((ref) {
  // SAMPLE DATA: Apps and paintings
  return const [
    GalleryItem(
      id: '1',
      title: 'Eventually',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/Eventually.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/Eventually.jpg',
    ),

    GalleryItem(
      id: '2',
      title: 'Numero Uno - Numerology Calculator 🔮 [LIVE]',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/numero_uno/refs/heads/main/Numero-uno.jpg',
      link: 'https://awes0m.github.io/numero_uno/',
    ),
    GalleryItem(
      id: '3',
      title: 'Fluttering Drums - Drum Machine 🥁 [LIVE]',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fluttering_drums/refs/heads/master/fluttering_drums.jpg',
      link: 'https://awes0m.github.io/fluttering_drums/',
    ),
    GalleryItem(
      id: '4',
      title: 'Fluttering Drums - Drum Machine-(Android Download)',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fluttering_drums/refs/heads/master/fluttering_drums.jpg',
      link:
          'https://github.com/awes0m/fluttering_drums/blob/master/buillt_app/fdrums_byAwesom.apk',
    ),
    GalleryItem(
      id: '5',
      title: 'Maa',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/DurgaSketch.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/DurgaSketch.jpg',
    ),
    GalleryItem(
      id: '6',
      title: 'Slider- A fun Numbers game! [LIVE]',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/glutter-fames/refs/heads/main/sliderr/SCREENSHOTS/Capture.JPG',
      link: 'https://awes0m.github.io/jsTgames/slider_game_flutter/#/',
    ),

    GalleryItem(
      id: '7',
      title: 'New Beginnings',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/New_Beginnings__April%E2%80%8E15.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/New_Beginnings__April%E2%80%8E15.jpg',
    ),
    // More apps
    GalleryItem(
      id: '8',
      title: 'Pyiano Download 🥁 [Android/Windows]',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/ppiano/refs/heads/main/ppiano.jpg',
      link: 'https://awes0m.github.io/ppiano/',
    ),
    GalleryItem(
      id: '9',
      title:
          'Rock Paper Somssers- Play the classic game You Vs Computer! [LIVE]',
      type: GalleryItemType.app,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1661607003079-4b95a804f9b2?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/jsTgames/rock_paper_scissors/index.html',
    ),

    GalleryItem(
      id: '10',
      title: 'The memory game [LIVE]',
      type: GalleryItemType.app,
      imageUrl:
          'https://images.unsplash.com/photo-1593873515742-2cbca56823b4?q=80&w=2056&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/jsTgames/memory_game/index.html',
    ),
    GalleryItem(
      id: '11',
      title: 'Wack a Mole [LIVE]',
      type: GalleryItemType.app,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1725408008366-390dfe32d0a6?q=80&w=1120&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/jsTgames/wack_a_mole/index.html',
    ),
    GalleryItem(
      id: '12',
      title: 'Godly Networking scripts',
      type: GalleryItemType.app,
      imageUrl:
          'https://plus.unsplash.com/premium_vector-1709212299200-262160b91eac?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/Godly-Networking-Scripts/',
    ),
    GalleryItem(
      id: '13',
      title: 'Drum-ru - A Virtual drum (Windows/PC Download)',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/pybeats/refs/heads/main/app-screenshot.JPG',
      link: 'https://github.com/awes0m/pybeats',
    ),
    GalleryItem(
      id: '14',
      title: 'Under The Umbrella',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/UnderTheUmbrella.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/UnderTheUmbrella.jpg',
    ),
    GalleryItem(
      id: '14',
      title: 'The Light and death',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/ryukLight.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/ryukLight.jpg',
    ),
  ];
});
