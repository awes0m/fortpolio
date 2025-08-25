import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gallery_item.dart';
import '../src/gallery_items_list.dart';

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
