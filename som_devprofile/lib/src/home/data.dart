import '../json_service.dart';

// Cache frequently accessed data to avoid repeated JSON parsing
class _DataCache {
  static String? _about;
  static String? _resume;
  static String? _name;
  static List<String>? _designation;
  static List<List<String>>? _socialMedia;

  // static void clearCache() {
  //   _about = null;
  //   _resume = null;
  //   _name = null;
  //   _designation = null;
  //   _socialMedia = null;
  // }
}

String about() {
  return _DataCache._about ??= JSONService.response['about']?.toString() ?? '';
}

String resume() {
  return _DataCache._resume ??=
      JSONService.response['resume_download_link']?.toString() ?? '';
}

String name() {
  return _DataCache._name ??=
      JSONService.response['name_and_link']?[0]?.toString() ?? '';
}

List<String> designation() {
  if (_DataCache._designation != null) return _DataCache._designation!;

  final designationData = JSONService.response['designation'];
  if (designationData is List) {
    _DataCache._designation = designationData.cast<String>();
  } else {
    _DataCache._designation = <String>[];
  }

  return _DataCache._designation!;
}

List<List<String>> socialMedia() {
  if (_DataCache._socialMedia != null) return _DataCache._socialMedia!;

  final List<List<String>> result = [];
  final socialMediaData = JSONService.response['social_media'];

  if (socialMediaData is Map<String, dynamic>) {
    for (final entry in socialMediaData.entries) {
      if (entry.value is List) {
        final List<String> socialMediaItem =
            (entry.value as List).map((item) => item.toString()).toList();
        result.add(socialMediaItem);
      }
    }
  }

  _DataCache._socialMedia = result;
  return result;
}
