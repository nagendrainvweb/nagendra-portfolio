import 'package:flutter/material.dart';
import 'package:personal_web/constants/types.dart';
import 'package:personal_web/models/responsive/responsive_layout.dart';
import 'package:personal_web/screens/pages/about/about.dart';
import 'package:personal_web/screens/pages/about/about_mobile.dart';
import 'package:personal_web/screens/pages/home/home.dart';
import 'package:personal_web/screens/pages/home/home_mobile.dart';
import 'package:personal_web/screens/pages/portfolio/portfolio.dart';
import 'package:personal_web/screens/pages/portfolio/portfolio_mobile.dart';
import 'package:personal_web/screens/pages/skills/skills.dart';
import 'package:personal_web/screens/pages/skills/skills_mobile.dart';
import 'package:personal_web/screens/shared/navbar/navbar.dart';

import '../../../models/responsive/screen_type_layout.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  Pages selectedPage = Pages.HOME;
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
    return Column(
      children: [
        ScreenTypeLayout(
          tablet: Navbar(
            selectedPage: selectedPage,
            onNavSelected: (item) {
              setState(() {
                selectedPage = item;
              });
            },
          ),
          mobile: SizedBox.shrink(),
        ),
        Expanded(child: pages[selectedPage]!)
      ],
    );
  }
}
