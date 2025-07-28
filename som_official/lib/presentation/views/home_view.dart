import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:som_official/presentation/viewmodels/portfolio_viewmodel.dart';
import 'package:som_official/presentation/widgets/header_widget.dart';
import 'package:som_official/presentation/widgets/carousel_widget.dart';
import 'package:som_official/presentation/widgets/cv_section_widget.dart';
import 'package:som_official/presentation/widgets/education_section_widget.dart';
import 'package:som_official/presentation/widgets/skills_section_widget.dart';
import 'package:som_official/presentation/widgets/workex_section_widget.dart';
import 'package:som_official/presentation/widgets/certifications_section_widget.dart';
import 'package:som_official/presentation/widgets/app_advert1_widget.dart';
import 'package:som_official/presentation/widgets/game_advert2_widget.dart';
import 'package:som_official/presentation/widgets/work_stats_widget.dart';
import 'package:som_official/presentation/widgets/footer_widget.dart';
import 'package:som_official/presentation/widgets/mobile_menu_drawer_widget.dart';

import '../../common/screen_helper.dart';
import '../../constants/constants.dart';

class HomeView extends ConsumerWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioState = ref.watch(portfolioViewModelProvider);

    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: ScreenHelper.isDesktop(context)
          ? null
          : const MobileMenuDrawerWidget(),
      body: portfolioState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : portfolioState.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${portfolioState.error}'),
                      ElevatedButton(
                        onPressed: () {
                          // Refresh data
                          ref.invalidate(portfolioViewModelProvider);
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : const SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Fixed header at top of the page
                      HeaderWidget(),

                      /// Body of the page
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselWidget(),
                              SizedBox(height: 20.0),
                              CvSectionWidget(),
                              SizedBox(height: 70.0),
                              EducationSectionWidget(),
                              SizedBox(height: 50.0),
                              SkillsSectionWidget(),
                              SizedBox(height: 50.0),
                              WorkexSectionWidget(),
                              SizedBox(height: 25.0),
                              CertificationsSectionWidget(),
                              AppAdvert1Widget(),
                              SizedBox(height: 40.0),
                              GameAdvert2Widget(),
                              SizedBox(height: 70.0),
                              WorkStatsWidget(),
                              FooterWidget(),
                              SizedBox(height: 5.0),
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
