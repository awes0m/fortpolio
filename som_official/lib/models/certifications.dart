// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyCertifications {
  final String title;
  final String logoImagePath;
  final String imagePath;
  MyCertifications({
    required this.title,
    required this.logoImagePath,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'logoImagePath': logoImagePath,
      'imagePath': imagePath,
    };
  }

  factory MyCertifications.fromMap(Map<String, dynamic> map) {
    return MyCertifications(
      title: map['title'] as String,
      logoImagePath: map['logoImagePath'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCertifications.fromJson(String source) =>
      MyCertifications.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Certifications(title: $title, logoImagePath: $logoImagePath, imagePath: $imagePath)';

  @override
  bool operator ==(covariant MyCertifications other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.logoImagePath == logoImagePath &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode =>
      title.hashCode ^ logoImagePath.hashCode ^ imagePath.hashCode;
}
