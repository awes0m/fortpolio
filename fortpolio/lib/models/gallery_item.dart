// MODEL: Represents either an app or a painting in the gallery.

enum GalleryItemType { app, painting }

class GalleryItem {
  final String id;
  final String title;
  final String description;
  final GalleryItemType type;
  final String imageUrl; // thumbnail or preview image
  final String link; // app = external link, painting = full image download URL
  final String? markdownUrl; // optional URL to README markdown

  const GalleryItem({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.imageUrl,
    required this.link,
    this.markdownUrl,
  });
}
