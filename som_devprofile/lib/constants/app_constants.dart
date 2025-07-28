class AppConstants {
  // Breakpoints
  static const double mobileBreakpoint = 1000.0;

  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  // Spacing
  static const double smallSpacing = 8.0;
  static const double mediumSpacing = 16.0;
  static const double largeSpacing = 24.0;
  static const double extraLargeSpacing = 32.0;

  // Border radius
  static const double smallBorderRadius = 4.0;
  static const double mediumBorderRadius = 8.0;
  static const double largeBorderRadius = 12.0;
  static const double extraLargeBorderRadius = 16.0;

  // Font sizes
  static const double smallFontSize = 12.0;
  static const double mediumFontSize = 16.0;
  static const double largeFontSize = 20.0;
  static const double extraLargeFontSize = 24.0;
  static const double titleFontSize = 32.0;

  // Asset paths
  static const String portfolioJsonPath = 'assets/portfolio.json';
  static const String homeAssetsPath = 'assets/home/';
  static const String whatIDoAssetsPath = 'assets/what_i_do/';
  static const String experienceAssetsPath = 'assets/experience/';
  static const String contactMeAssetsPath = 'assets/contact_me/';
  static const String educationAssetsPath = 'assets/education/';
  static const String projectsAssetsPath = 'assets/projects/';
  static const String achievementsAssetsPath = 'assets/achievements/';

  // Navigation
  static const int totalSections = 7;
  static const List<String> sectionNames = [
    'Home',
    'What I Do',
    'Education',
    'Experience',
    'Projects',
    'Certifications',
    'Contact Me',
  ];

  // Social media platforms
  static const Map<String, String> socialMediaIcons = {
    'github': 'github',
    'leetcode': 'leetcode',
    'linkedin': 'linkedin',
    'stackoverflow': 'stackoverflow',
    'twitter': 'twitter',
    'email': 'email',
  };
}

class AppStrings {
  static const String appTitle = 'Som Subhra Pandit - Portfolio';
  static const String loadingMessage = 'Loading Portfolio...';
  static const String errorLoadingData = 'Error loading portfolio data';
  static const String retryButton = 'Retry';

  // Navigation
  static const String homeNavButton = 'Home';
  static const String whatIDoNavButton = 'What I Do';
  static const String educationNavButton = 'Education';
  static const String experienceNavButton = 'Experience';
  static const String projectsNavButton = 'Projects';
  static const String certificationsNavButton = 'Certifications';
  static const String contactMeNavButton = 'Contact Me';

  // Accessibility
  static const String themeToggleSemanticLabel = 'Toggle theme';
  static const String navigationMenuSemanticLabel = 'Navigation menu';
  static const String socialMediaLinkSemanticLabel = 'Social media link';
}
