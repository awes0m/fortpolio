// ignore_for_file: avoid_web_libraries_in_flutter
// This file is intended for Flutter Web only.

import 'dart:html' as html;

// Open external links in a new browser tab (for app-type items).
void openInNewTab(String url) {
  html.window.open(url, '_blank');
}

// Download an image using AnchorElement download attribute.
void downloadFromUrl({required String url, String? suggestedFileName}) {
  final anchor = html.AnchorElement(href: url)
    ..download = suggestedFileName ?? url.split('/').last
    ..target = '_blank';
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
