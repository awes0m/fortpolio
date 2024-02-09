import 'package:flutter/material.dart';

import 'certifications.dart';
import 'contact_me.dart';
import 'education.dart';
import 'experience.dart';
import 'home.dart';
import 'projects.dart';
import 'what_i_do.dart';

export 'certifications.dart';
export 'contact_me.dart';
export 'education.dart';
export 'experience.dart';
export 'home.dart';
export 'projects.dart';
export 'scroll_controller.dart';
export 'what_i_do.dart';

List<Widget> webHeaderList = [
  const HomePage(),
  WhatIdo(),
  Education(),
  Experience(),
  Projects(),
  Certifications(),
  const ContactMe(),
];
