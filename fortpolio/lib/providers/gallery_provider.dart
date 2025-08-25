import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gallery_item.dart';

// PROVIDER: Single source of truth for gallery items.
// Using a simple Provider<List<GalleryItem>> so it’s easy to swap with an async API later.
final galleryProvider = Provider<List<GalleryItem>>((ref) {
  // SAMPLE DATA: Apps and paintings
  return const [
    GalleryItem(
      id: '1',
      title: 'Starry Night',
      type: GalleryItemType.painting,
      imageUrl:
          'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&w=800&q=60',
      link:
          'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&w=2000&q=80',
    ),
    GalleryItem(
      id: '2',
      title: 'My Cool App',
      type: GalleryItemType.app,
      imageUrl:
          'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?auto=format&w=800&q=60',
      link: 'https://play.google.com/store/apps/details?id=my.cool.app',
    ),
    // More paintings
    GalleryItem(
      id: '3',
      title: 'Ocean Breeze',
      type: GalleryItemType.painting,
      imageUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&w=800&q=60',
      link:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&w=2000&q=80',
    ),
    GalleryItem(
      id: '4',
      title: 'Forest Lake',
      type: GalleryItemType.painting,
      imageUrl:
          'https://images.unsplash.com/photo-1500048993953-d23a436266cf?auto=format&w=800&q=60',
      link:
          'https://images.unsplash.com/photo-1500048993953-d23a436266cf?auto=format&w=2000&q=80',
    ),
    // More apps
    GalleryItem(
      id: '5',
      title: 'Task Master',
      type: GalleryItemType.app,
      imageUrl:
          'https://images.unsplash.com/photo-1551033406-611cf9a28f67?auto=format&w=800&q=60',
      link: 'https://example.com/task-master',
    ),
    GalleryItem(
      id: '6',
      title: 'Fitness Pro',
      type: GalleryItemType.app,
      imageUrl:
          'https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&w=800&q=60',
      link: 'https://example.com/fitness-pro',
    ),
  ];
});

// PROVIDER FAMILY: Retrieve a single item by id for the detail page.
final galleryItemByIdProvider = Provider.family<GalleryItem?, String>((
  ref,
  id,
) {
  final items = ref.watch(galleryProvider);
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null; // Not found
});

// FILTER: Category filter state (Both = default)
enum GalleryFilter { both, app, painting }

final galleryFilterProvider = StateProvider<GalleryFilter>((ref) {
  return GalleryFilter.both;
});

// DERIVED: Filtered items based on the current filter
final filteredGalleryProvider = Provider<List<GalleryItem>>((ref) {
  final filter = ref.watch(galleryFilterProvider);
  final items = ref.watch(galleryProvider);
  switch (filter) {
    case GalleryFilter.both:
      return items;
    case GalleryFilter.app:
      return items.where((i) => i.type == GalleryItemType.app).toList();
    case GalleryFilter.painting:
      return items.where((i) => i.type == GalleryItemType.painting).toList();
  }
});
