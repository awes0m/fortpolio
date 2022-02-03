import 'package:som_official/models/design_process.dart';
import 'package:som_official/models/education.dart';
import 'package:som_official/models/skills.dart';

//cv section components
final List<DesignProcess> designProcesses = [
  const DesignProcess(
    title: 'DESIGN',
    imagePath: 'assets/design.png',
    subtitle:
        'A full stack all round flutter designer, who can design any kind of UI/UX for any kind of app.',
  ),
  const DesignProcess(
    title: 'DEVELOP',
    imagePath: 'assets/develop.png',
    subtitle:
        'Develop your ideas into beautiful working applications, \nwith the help of flutter.',
  ),
  const DesignProcess(
    title: 'SECURE',
    imagePath: 'assets/write.png',
    subtitle:
        'Check and resolve Vulnerabilities in your application/website ,keep your sensitive data safe.',
  ),
  const DesignProcess(
    title: 'MANAGE',
    imagePath: 'assets/promote.png',
    subtitle:
        'We will maintain your software assets Fully or Partially, and also provide support and improvements.',
  )
];

//Education section Detail list
final List<Education> educationList = [
  Education(
    description:
        "This is a sample education and details about it is started below",
    linkName: "www.apisod.com",
    period: "2019-PRESENT",
  ),
  Education(
    description:
        "This is a sample education and details about it is started below",
    linkName: "www.apisod.com",
    period: "2015-2019",
  ),
  Education(
    description:
        "This is a sample education and details about it is started below",
    linkName: "www.apisod.com",
    period: "2010-2015",
  ),
  Education(
    description:
        "This is a sample education and details about it is started below",
    linkName: "www.apisod.com",
    period: "2010-2015",
  ),
];

//Skill section Detail list
final List<Skill> skills = [
  Skill(skillName: "Dart", percentage: 62),
  Skill(skillName: "Python", percentage: 80),
  Skill(skillName: "Vulneribility Management", percentage: 76),
  Skill(skillName: "Firebase", percentage: 62),
  Skill(skillName: "JavaScript", percentage: 62),
];
