//dependencies
import 'package:flutter/material.dart';
import 'package:som_official/utils/screen_helper.dart';

//imports
import 'components/carousel.dart';
import 'components/certifications_section.dart';
import 'components/cv_section.dart';
import 'components/education_section.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/component_item_lists/header_items.dart';
import 'components/skills_section.dart';
import 'components/testimonials_section.dart';
import 'components/work_advert2.dart';
import 'components/work_stats.dart';
import '../../utils/constants.dart';
import '../../utils/globals.dart';
import 'components/work_advert1.dart';

//HomePage
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold is a full page layout for the major Material Components.

      key: Globals.scaffoldKey,

      //Building the EndDrawer for the App with headerItems
      endDrawer: ScreenHelper.isDesktop(context)
          ? null
          : Drawer(
              child: SafeArea(
                child: Padding(
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
                                  color: kDangerColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: TextButton(
                                  onPressed: headerItems[index].onTap,
                                  child: Text(
                                    headerItems[index].title,
                                    style: const TextStyle(
                                      color: Colors.white,
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
                                style: const TextStyle(color: Colors.white),
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
            ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(), //fixed header at top of the page(column)
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Carousel(),
                    const SizedBox(
                      //WhiteSpace 20
                      height: 20.0,
                    ),
                    const CvSection(),
                    const WorkAdvert1(),
                    SizedBox(height: 70.0), //White space 70
                    const WorkAdvert2(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 28.0),
                      child: WorkStats(),
                    ),
                    const SizedBox(height: 50.0), //White space 50
                    const EducationSection(),
                    const SizedBox(height: 50.0), //White space 50
                    const SkillsSection(),
                    const SizedBox(height: 50.0), //White space 50
                    const CertificationsSection(),
                    const SizedBox(height: 50.0), //White space 50
                    const Testimonials(),
                    const Footer(),
                    const SizedBox(height: 5.0), //White space 50
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
