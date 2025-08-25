// MODEL: Represents either an app or a painting in the gallery.

enum GalleryItemType { app, painting }

class GalleryItem {
  final String id;
  final String title;
  final GalleryItemType type;
  final String imageUrl; // thumbnail or preview image
  final String link; // app = external link, painting = full image download URL

  const GalleryItem({
    required this.id,
    required this.title,
    required this.type,
    required this.imageUrl,
    required this.link,
  });
}
