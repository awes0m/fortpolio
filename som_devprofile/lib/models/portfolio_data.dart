class PortfolioData {
  final String name;
  final String githubLink;
  final List<String> designations;
  final String resumeDownloadLink;
  final Map<String, SocialMedia> socialMedia;
  final ContactInfo contactInfo;
  final String about;
  final String bio;
  final WhatIDo whatIDo;
  final Map<String, Education> education;
  final Map<String, Experience> experience;
  final Map<String, Project> projects;
  final Map<String, Achievement> achievements;

  const PortfolioData({
    required this.name,
    required this.githubLink,
    required this.designations,
    required this.resumeDownloadLink,
    required this.socialMedia,
    required this.contactInfo,
    required this.about,
    required this.bio,
    required this.whatIDo,
    required this.education,
    required this.experience,
    required this.projects,
    required this.achievements,
  });

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      name: json['name_and_link'][0] as String,
      githubLink: json['name_and_link'][1] as String,
      designations: List<String>.from(json['designation']),
      resumeDownloadLink: json['resume_download_link'] as String,
      socialMedia: (json['social_media'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          SocialMedia.fromJson(value as List<dynamic>),
        ),
      ),
      contactInfo:
          ContactInfo.fromJson(json['contact_me'] as Map<String, dynamic>),
      about: json['about'] as String,
      bio: json['bio'] as String,
      whatIDo: WhatIDo.fromJson(json['what_i_do'] as Map<String, dynamic>),
      education: (json['education'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          Education.fromJson(value as Map<String, dynamic>),
        ),
      ),
      experience: (json['experience'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          Experience.fromJson(value as Map<String, dynamic>),
        ),
      ),
      projects: (json['projects'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          Project.fromJson(value as Map<String, dynamic>),
        ),
      ),
      achievements: (json['achievements'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          Achievement.fromJson(value as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class SocialMedia {
  final String url;
  final String platform;

  const SocialMedia({
    required this.url,
    required this.platform,
  });

  factory SocialMedia.fromJson(List<dynamic> json) {
    return SocialMedia(
      url: json[0] as String,
      platform: json[1] as String,
    );
  }
}

class ContactInfo {
  final String location;
  final String openForOpportunities;
  final String picture;

  const ContactInfo({
    required this.location,
    required this.openForOpportunities,
    required this.picture,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      location: json['location'] as String,
      openForOpportunities: json['open_for_opportunities'] as String,
      picture: json['picture'] as String,
    );
  }
}

class WhatIDo {
  final List<String> tools;
  final List<Proficiency> proficiencies;

  const WhatIDo({
    required this.tools,
    required this.proficiencies,
  });

  factory WhatIDo.fromJson(Map<String, dynamic> json) {
    return WhatIDo(
      tools: List<String>.from(json['tools']),
      proficiencies: (json['proficiency'] as List<dynamic>)
          .map((item) => Proficiency.fromString(item as String))
          .toList(),
    );
  }
}

class Proficiency {
  final String skill;
  final int percentage;

  const Proficiency({
    required this.skill,
    required this.percentage,
  });

  factory Proficiency.fromString(String data) {
    final parts = data.split('--');
    return Proficiency(
      skill: parts[0],
      percentage: int.parse(parts[1]),
    );
  }
}

class Education {
  final String institute;
  final String location;
  final String years;
  final String description;
  final String grades;
  final String logo;

  const Education({
    required this.institute,
    required this.location,
    required this.years,
    required this.description,
    required this.grades,
    required this.logo,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institute: json['institute'] as String,
      location: json['location'] as String,
      years: json['years'] as String,
      description: json['description'] as String,
      grades: json['grades'] as String,
      logo: json['logo'] as String,
    );
  }
}

class Experience {
  final String name;
  final String role;
  final String period;
  final String description;
  final String imageName;

  const Experience({
    required this.name,
    required this.role,
    required this.period,
    required this.description,
    required this.imageName,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      name: json['name'] as String,
      role: json['role'] as String,
      period: json['period'] as String,
      description: json['description'] as String,
      imageName: json['image_name'] as String,
    );
  }
}

class Project {
  final String name;
  final String techStackUsed;
  final String description;
  final String generalOrGithubLink;

  const Project({
    required this.name,
    required this.techStackUsed,
    required this.description,
    required this.generalOrGithubLink,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'] as String,
      techStackUsed: json['tech_stack_used'] as String,
      description: json['description'] as String,
      generalOrGithubLink: json['general_or_github_link'] as String,
    );
  }
}

class Achievement {
  final String description;
  final String link;

  const Achievement({
    required this.description,
    required this.link,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      description: json['description'] as String,
      link: json['link'] as String,
    );
  }
}
