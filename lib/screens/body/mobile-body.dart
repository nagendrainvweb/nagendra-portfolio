import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_web/constants/types.dart';
import 'package:personal_web/controllers/main-controller.dart';
import 'package:personal_web/models/responsive/responsive_layout.dart';
import 'package:personal_web/screens/pages/about/about.dart';
import 'package:personal_web/screens/pages/about/about_mobile.dart';
import 'package:personal_web/screens/pages/home/home.dart';
import 'package:personal_web/screens/pages/home/home_mobile.dart';
import 'package:personal_web/screens/pages/portfolio/portfolio.dart';
import 'package:personal_web/screens/pages/portfolio/portfolio_mobile.dart';
import 'package:personal_web/screens/pages/skills/skills.dart';
import 'package:personal_web/screens/pages/skills/skills_mobile.dart';
import 'package:personal_web/screens/shared/drawer.dart';
import 'package:personal_web/screens/shared/nav_bar.dart';

// ignore: must_be_immutable
class MobileBody extends StatelessWidget {
  Widget page;
  Pages selectedPage;
  MobileBody({required this.page, required this.selectedPage});

    final pages = {
    Pages.HOME: ResponsiveLayout(
      desktopView: HomeSection(),
      mobileView: HomeSectionMobile(),
      tabletView: HomeSection(),
    ),
    Pages.ABOUT: ResponsiveLayout(
      desktopView: AboutSection(),
      mobileView: AboutSectionMobile(),
      tabletView: AboutSection(),
    ),
    Pages.SKILLS: ResponsiveLayout(
      desktopView: SkillsSection(),
      mobileView: SkillsSectionMobile(),
      tabletView: SkillsSection(),
    ),
    Pages.PORTFOLIO: ResponsiveLayout(
      desktopView: PortfolioSection(),
      mobileView: PortfolioSectionMobile(),
      tabletView: PortfolioSection(),
    ),
    Pages.RESUME: ResponsiveLayout(
      desktopView: HomeSection(),
      mobileView: HomeSectionMobile(),
      tabletView: HomeSection(),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileNavbar(),
      endDrawer: AppDrawer(
        selectedPage: selectedPage,
      ),
      body: GetX<MainController>(
          builder: (controller) => pages[controller.selectedPage.value] ?? pages[Pages.HOME]!),
    );
  }
}
