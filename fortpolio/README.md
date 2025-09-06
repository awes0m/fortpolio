# Walkman-style Gallery (Flutter Web)

![App Logo](/assets/som_home_icon.png)

A responsive Flutter Web application featuring a Sony Walkman-style floating album display. Built with default Flutter routing and Riverpod for state management.

## Features

- Walkman-style animated carousel with tilt, scale, and shadows
- Hover animations (desktop) and tap interactions (mobile)
- Two item types: Apps (open in new tab) and Paintings (detail + download)
- Default Navigator routing (no third-party navigation)
- Riverpod-based, easily swappable data source
- Fully responsive for desktop, tablet, and mobile

## Tech Stack

- Flutter (Web)
- Riverpod (`flutter_riverpod`)
- Default Navigator routing with `onGenerateRoute`

## Project Structure

```
lib/
  main.dart
  theme/
    app_theme.dart
  models/
    gallery_item.dart
  providers/
    gallery_provider.dart
  utils/
    web_actions.dart
  pages/
    landing_page.dart
    painting_detail_page.dart
  widgets/
    walkman_album.dart
```

## Data Model

```
class GalleryItem {
  final String id;
  final String title;
  final GalleryItemType type; // app | painting
  final String imageUrl;      // thumbnail/preview
  final String link;          // app: external URL, painting: full image URL
}
```

- Enum: `GalleryItemType { app, painting }`

## State Management (Riverpod)

- `galleryProvider`: Provides a list of `GalleryItem` objects (sample data included)
- `galleryItemByIdProvider`: Lookup a single item by `id` for the detail page

You can replace the static list with an API later by changing `galleryProvider` to an async provider.

## Routing

- `/` → Landing page with the Walkman-style carousel
- `/painting/:id` → Painting detail page with full image and download button

Routing is handled in `main.dart` with `routes` and `onGenerateRoute`.

## Run the App (Web)

1. Enable Flutter web (one-time):
   ```bash
   flutter config --enable-web
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run in a browser (Chrome or Edge):
   ```bash
   flutter run -d chrome
   # or
   flutter run -d edge
   ```
4. Build for release (optional):
   ```bash
   flutter build web
   ```

## Key Files

- `lib/pages/landing_page.dart`

  - Displays the Walkman-style carousel (`WalkmanAlbum`)
  - Click handling: app → open new tab, painting → navigate to detail
- `lib/widgets/walkman_album.dart`

  - Animated carousel with perspective, tilt, scale, and shadows
  - Responsive `viewportFraction` and simple dots indicator
- `lib/pages/painting_detail_page.dart`

  - Shows the full image
  - Download button uses `dart:html` anchor to trigger browser download (web only)
- `lib/utils/web_actions.dart`

  - `openInNewTab(url)`
  - `downloadFromUrl(url, suggestedFileName)`

## Customization

- Add/modify sample items in `lib/src/gallery_items_list.dart`
- Change colors/typography in `lib/theme/app_theme.dart`
- Tweak animation feel (tilt, scale, elevation) in `lib/widgets/walkman_album.dart`

## Troubleshooting

- If you see info-level deprecation warnings about `dart:html`, they are safe for web usage. You can replace with `package:web` + `js_interop` later if needed.
- If network images don’t load due to CORS or provider limitations, replace the sample URLs with your own image hosting links.

## License

This project is provided as-is for demonstration. Replace assets/links with your own content if distributing.
