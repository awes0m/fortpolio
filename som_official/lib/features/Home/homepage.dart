//dependencies
import 'package:flutter/material.dart';

//imports
import '../../common/screen_helper.dart';
import '../../constants/constants.dart';
import '../../constants/globals.dart';
import 'components/sec1_carousel.dart';
import 'components/sec10_certifications_section.dart';
import 'components/sec2_cv_section.dart';
import 'components/sec7_education_section.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/sec8_skills_section.dart';
import 'components/sec11_testimonials_section.dart';
import 'components/sec5_game_advert2.dart';
import 'components/sec4_app_advert1.dart';

import 'components/items/header_items.dart';
import 'components/sec6_work_stats.dart';
import 'components/sec3_workex_section.dart';

/// The main Page containing all the sections of the resume
class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold is a full page layout for the major Material Components.

      key: Globals.scaffoldKey,

      //Building the EndDrawer for the App with headerItems
      endDrawer:
          ScreenHelper.isDesktop(context) ? null : const MobileMenuDrawer(),
      body: const SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// fixed header at top of the page(column)
            Header(),

            /// Body of the page
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Carousel(),
                    SizedBox(height: 20.0), //WhiteSpace 20
                    CvSection(),
                    SizedBox(height: 70.0), //White space 70
                    WorkStats(),
                    SizedBox(height: 40.0), //White space 40
                    AppAdvert1(),
                    SizedBox(height: 40.0), //White space 40
                    GameAdvert2(),

                    SizedBox(height: 70.0), //White space 50
                    EducationSection(),
                    SizedBox(height: 50.0), //White space 50
                    SkillsSection(),
                    SizedBox(height: 50.0), //White space 50
                    WorkexSection(),
                    SizedBox(height: 25.0), //White space 25
                    CertificationsSection(),
                    SizedBox(height: 70.0), //White space 50
                    Testimonials(),
                    Footer(),
                    SizedBox(height: 5.0), //White space 50
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileMenuDrawer extends StatelessWidget {
  const MobileMenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: kPrimaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return headerItems[index].isButton
                  ? MouseRegion(
                      //If the item is a button, we add a MouseRegion to make it clickable
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: TextButton(
                          onPressed: headerItems[index].onTap,
                          child: Text(
                            headerItems[index].title,
                            style: const TextStyle(
                              color: kCaptionColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ListTile(
                      //If the item is not a button, we add a ListTile
                      title: Text(
                        headerItems[index].title,
                        style: const TextStyle(color: kCaptionColor),
                      ),
                      onTap: headerItems[index].onTap,
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10.0,
              );
            },
            itemCount: headerItems.length,
          ),
        ),
      ),
    );
  }
}
