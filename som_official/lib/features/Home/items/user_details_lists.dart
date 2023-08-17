import '../../../models/design_process.dart';
import '../../../models/education.dart';
import '../../../models/skills.dart';
import '../../../models/testimonial.dart';
import '../../../models/workex.dart';

/// cv section components
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

/// Education section Detail list
final List<Education> educationList = [
  Education(
    description:
        "Kalinga Institute of Industrial Technology,\nBhubaneswar, India",
    linkName: "www.kiit.ac.in",
    period: "2015-2019",
  ),
  Education(
    description: "VIBRANT ACADEMY\n Kota,Rajasthan, India",
    linkName: "www.vibrantacademy.com",
    period: "2012-2015",
  ),
  Education(
    description: "ST. XAVIERS'S SCHOOL,\nDurgapur,West Bengal,India",
    linkName: "sxsdgp.edu.in",
    period: "2012-2008",
  ),
];

/// Skill section Detail list
final List<Skill> skills = [
  Skill(skillName: "Dart", percentage: 62),
  Skill(skillName: "Python", percentage: 80),
  Skill(skillName: "Vulneribility Management", percentage: 76),
  Skill(skillName: "Firebase", percentage: 62),
  Skill(skillName: "JavaScript", percentage: 62),
];

final List<Workex> workexList = [
  Workex(
    description: "Senior Network Administrator, \n WIPRO TECHNOLOGIES",
    linkName: "www.wipro.com",
    period: "2019-PRESENT",
  ),
  Workex(
    description: "Web Developer, \n Freelancer",
    linkName: "www.apisod.com",
    period: "2017-Present",
  ),
];

//Testimonials
final List<Testimonial> testimonials = [
  Testimonial(
    personname: 'jENNY DOE',
    profilephoto: 'assets/female.png',
    text: "Lovely app, I'm using it everyday. I'm a big fan of it.",
    occupation: "PRODUCT DESIGNER",
  ),
  Testimonial(
      personname: 'KEN WILLIAMS',
      profilephoto: 'assets/male.png',
      text: "Lovely app, I'm using it everyday. I'm a big fan of it.",
      occupation: "PRODUCT DESIGNER"),
];
