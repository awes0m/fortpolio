import 'package:som_official/models/carousel_item_model.dart';
import 'package:som_official/models/education.dart';
import 'package:som_official/models/skills.dart';
import 'package:som_official/models/workex.dart';
import 'package:som_official/models/certifications.dart';
import 'package:som_official/models/stats.dart';

class PortfolioState {
  final List<CarouselItemModel> carouselItems;
  final List<Education> education;
  final List<Skill> skills;
  final List<Workex> workExperience;
  final List<MyCertifications> certifications;
  final List<Stat> stats;
  final bool isLoading;
  final String? error;

  const PortfolioState({
    this.carouselItems = const [],
    this.education = const [],
    this.skills = const [],
    this.workExperience = const [],
    this.certifications = const [],
    this.stats = const [],
    this.isLoading = false,
    this.error,
  });

  PortfolioState copyWith({
    List<CarouselItemModel>? carouselItems,
    List<Education>? education,
    List<Skill>? skills,
    List<Workex>? workExperience,
    List<MyCertifications>? certifications,
    List<Stat>? stats,
    bool? isLoading,
    String? error,
  }) {
    return PortfolioState(
      carouselItems: carouselItems ?? this.carouselItems,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      workExperience: workExperience ?? this.workExperience,
      certifications: certifications ?? this.certifications,
      stats: stats ?? this.stats,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PortfolioState &&
        other.carouselItems == carouselItems &&
        other.education == education &&
        other.skills == skills &&
        other.workExperience == workExperience &&
        other.certifications == certifications &&
        other.stats == stats &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  @override
  int get hashCode {
    return carouselItems.hashCode ^
        education.hashCode ^
        skills.hashCode ^
        workExperience.hashCode ^
        certifications.hashCode ^
        stats.hashCode ^
        isLoading.hashCode ^
        error.hashCode;
  }
}
