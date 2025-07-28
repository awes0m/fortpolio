import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:som_official/domain/entities/portfolio_state.dart';
import 'package:som_official/models/carousel_item_model.dart';
import 'package:som_official/models/education.dart';
import 'package:som_official/models/skills.dart';
import 'package:som_official/models/workex.dart';
import 'package:som_official/models/certifications.dart';
import 'package:som_official/models/stats.dart';

class PortfolioViewModel extends StateNotifier<PortfolioState> {
  PortfolioViewModel() : super(const PortfolioState()) {
    _initializeData();
  }

  void _initializeData() {
    // Load initial data
    _loadCarouselItems();
    _loadEducation();
    _loadSkills();
    _loadWorkExperience();
    _loadCertifications();
    _loadStats();
  }

  void _loadCarouselItems() {
    // This would typically come from a repository
    final carouselItems = <CarouselItemModel>[
      // Add your carousel items here based on existing data
    ];

    state = state.copyWith(carouselItems: carouselItems);
  }

  void _loadEducation() {
    final educationList = <Education>[
      // Add your education data here
    ];

    state = state.copyWith(education: educationList);
  }

  void _loadSkills() {
    final skillsList = <Skill>[
      // Add your skills data here
    ];

    state = state.copyWith(skills: skillsList);
  }

  void _loadWorkExperience() {
    final workExList = <Workex>[
      // Add your work experience data here
    ];

    state = state.copyWith(workExperience: workExList);
  }

  void _loadCertifications() {
    final certificationsList = <MyCertifications>[
      // Add your certifications data here
    ];

    state = state.copyWith(certifications: certificationsList);
  }

  void _loadStats() {
    final statsList = <Stat>[
      // Add your stats data here
    ];

    state = state.copyWith(stats: statsList);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }
}

// Provider
final portfolioViewModelProvider =
    StateNotifierProvider<PortfolioViewModel, PortfolioState>((ref) {
  return PortfolioViewModel();
});
