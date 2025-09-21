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
      description:
          'A serene landscape painting capturing the essence of time and nature.',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/Eventually.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/Eventually.jpg',
    ),

    GalleryItem(
      id: '2',
      title: 'Numero Uno - Numerology Calculator 🔮 [LIVE]',
      description:
          'Calculate your numerology numbers and discover insights about your personality.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/numero_uno/refs/heads/main/Numero-uno.jpg',
      link: 'https://awes0m.github.io/numero_uno/',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/numero_uno/refs/heads/main/README.md',
    ),
    GalleryItem(
      id: '3',
      title: 'Fluttering Drums - Drum Machine 🥁 [LIVE]',
      description:
          'Create beats and rhythms with this interactive drum machine app.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fluttering_drums/refs/heads/master/fluttering_drums.jpg',
      link: 'https://awes0m.github.io/fluttering_drums/',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/fluttering_drums/refs/heads/master/README.md',
    ),
    GalleryItem(
      id: '4',
      title: "Awesom Cybersec Home",
      description:
          'a fully featured, responsive browser homepage with favorites, notes, tasks, bookmark import, and cybersecurity news feeds.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/CybersecHome/refs/heads/main/app_sc.jpg',
      link: 'https://awes0m.github.io/awesom_browser_tools/#home',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/CybersecHome/refs/heads/main/README.md',
    ),
    GalleryItem(
      id: '5',
      title: 'Maa',
      description: 'A beautiful sketch depicting the divine mother Durga.',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/DurgaSketch.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/DurgaSketch.jpg',
    ),
    GalleryItem(
      id: '6',
      title: 'Slider- A fun Numbers game! [LIVE]',
      description: 'A sliding puzzle game where you arrange numbers in order.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/glutter-fames/refs/heads/main/sliderr/SCREENSHOTS/Capture.JPG',
      link: 'https://awes0m.github.io/jsTgames/slider_game_flutter/#/',
    ),

    GalleryItem(
      id: '7',
      title: 'The Prisoner\'s Dilemma',
      description: ' the classic Prisoner\'s Dilemma game theory concept.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/tpdgame/refs/heads/main/assets/screenshots/main_page.jpg',
      link:
          'https://github.com/awes0m/tpdgame/blob/main/awes0m.github.io/the_prisoners_dilema',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/tpdgame/refs/heads/main/README.md',
    ),
    // More apps
    GalleryItem(
      id: '8',
      title: 'Pyiano Download 🥁 [Android/Windows]',
      description: 'A virtual piano app for creating music and melodies.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/ppiano/refs/heads/main/ppiano.jpg',
      link: 'https://awes0m.github.io/ppiano/',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/ppiano/refs/heads/main/README.md',
    ),
    GalleryItem(
      id: '9',
      title:
          'Rock Paper Somssers- Play the classic game You Vs Computer! [LIVE]',
      description:
          'Challenge the computer in the timeless rock-paper-scissors game.',
      type: GalleryItemType.app,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1661607003079-4b95a804f9b2?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/jsTgames/rock_paper_scissors/index.html',
    ),

    GalleryItem(
      id: '10',
      title: 'The memory game [LIVE]',
      description:
          'Test and improve your memory with this fun card-matching game.',
      type: GalleryItemType.app,
      imageUrl:
          'https://images.unsplash.com/photo-1593873515742-2cbca56823b4?q=80&w=2056&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/jsTgames/memory_game/index.html',
    ),
    GalleryItem(
      id: '11',
      title: 'Wack a Mole [LIVE]',
      description: 'Hit the moles as they appear in this classic arcade game.',
      type: GalleryItemType.app,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1725408008366-390dfe32d0a6?q=80&w=1120&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/jsTgames/wack_a_mole/index.html',
    ),
    GalleryItem(
      id: '12',
      title: 'Godly Networking scripts',
      description:
          'Collection of powerful networking scripts for various tasks.',
      type: GalleryItemType.app,
      imageUrl:
          'https://plus.unsplash.com/premium_vector-1709212299200-262160b91eac?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      link: 'https://awes0m.github.io/Godly-Networking-Scripts/',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/Godly-Networking-Scripts/refs/heads/main/README.md',
    ),
    GalleryItem(
      id: '13',
      title: 'Drum-ru - A Virtual drum (Windows/PC Download)',
      description: 'A virtual drum kit for creating rhythms on your PC.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/pybeats/refs/heads/main/app-screenshot.JPG',
      link: 'https://github.com/awes0m/pybeats',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/pybeats/refs/heads/main/README.md',
    ),
    GalleryItem(
      id: '14',
      title: 'Giyu_tanjiro',
      description: 'A fan art depicting characters from Demon Slayer.',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/Giyu_tanjiro.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/Giyu_tanjiro.jpg',
    ),
    GalleryItem(
      id: '15',
      title: 'The Light and death',
      description:
          'A dramatic painting exploring themes of light and mortality.',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/ryukLight.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/ryukLight.jpg',
    ),
    GalleryItem(
      id: '16',
      title: 'What is God [Beta Build]',
      description:
          'A thought-provoking exploration of consciousness and existence.',
      type: GalleryItemType.app,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/god/refs/heads/main/app_sc.jpg',
      link: 'https://awes0m.github.io/god/',
      markdownUrl:
          'https://raw.githubusercontent.com/awes0m/god/refs/heads/main/README.md',
    ),
    GalleryItem(
      id: '17',
      title: 'New Beginnings',
      description: 'An abstract painting symbolizing fresh starts and hope.',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/New_Beginnings__April%E2%80%8E15.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/New_Beginnings__April%E2%80%8E15.jpg',
    ),
    GalleryItem(
      id: '18',
      title: 'Under The Umbrella',
      description: 'A cozy scene of figures sharing an umbrella in the rain.',
      type: GalleryItemType.painting,
      imageUrl:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/UnderTheUmbrella.jpg',
      link:
          'https://raw.githubusercontent.com/awes0m/fortpolio/refs/heads/main/artworks/UnderTheUmbrella.jpg',
    ),
  ];
});
