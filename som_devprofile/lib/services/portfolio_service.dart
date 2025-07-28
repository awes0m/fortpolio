import 'dart:convert';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';
import '../models/portfolio_data.dart';

class PortfolioService {
  static PortfolioService? _instance;
  static PortfolioService get instance =>
      _instance ??= PortfolioService._internal();

  PortfolioService._internal();

  PortfolioData? _portfolioData;
  bool _isLoaded = false;
  String? _error;

  PortfolioData? get portfolioData => _portfolioData;
  bool get isLoaded => _isLoaded;
  String? get error => _error;

  Future<void> loadPortfolioData() async {
    if (_isLoaded && _portfolioData != null) return;

    try {
      _error = null;
      final String jsonString =
          await rootBundle.loadString(AppConstants.portfolioJsonPath);
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      _portfolioData = PortfolioData.fromJson(jsonData);
      _isLoaded = true;
    } catch (e) {
      _error = 'Failed to load portfolio data: $e';
      _isLoaded = false;
      rethrow;
    }
  }

  void clearCache() {
    _portfolioData = null;
    _isLoaded = false;
    _error = null;
  }

  // Convenience getters
  String get name => _portfolioData?.name ?? '';
  String get about => _portfolioData?.about ?? '';
  String get bio => _portfolioData?.bio ?? '';
  String get resumeLink => _portfolioData?.resumeDownloadLink ?? '';
  List<String> get designations => _portfolioData?.designations ?? [];
  Map<String, SocialMedia> get socialMedia => _portfolioData?.socialMedia ?? {};
  ContactInfo? get contactInfo => _portfolioData?.contactInfo;
  WhatIDo? get whatIDo => _portfolioData?.whatIDo;
  Map<String, Education> get education => _portfolioData?.education ?? {};
  Map<String, Experience> get experience => _portfolioData?.experience ?? {};
  Map<String, Project> get projects => _portfolioData?.projects ?? {};
  Map<String, Achievement> get achievements =>
      _portfolioData?.achievements ?? {};
}
