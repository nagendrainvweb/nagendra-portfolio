import 'package:get/get.dart';
import 'package:personal_web/constants/colors.dart';
import 'package:personal_web/constants/routes.dart';
import 'package:personal_web/constants/types.dart';
import 'package:personal_web/controllers/main-controller.dart';
import 'package:personal_web/models/responsive/layout_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:personal_web/screens/pages/about/about.dart';
import 'package:personal_web/screens/pages/about/about_mobile.dart';
import 'package:personal_web/screens/pages/home/home.dart';
import 'package:personal_web/screens/pages/home/home_mobile.dart';
import 'package:personal_web/screens/pages/main_navigation/main_navigation_page.dart';
import 'package:personal_web/screens/pages/portfolio/portfolio.dart';
import 'package:personal_web/screens/pages/portfolio/portfolio_mobile.dart';
import 'package:personal_web/screens/pages/skills/skills.dart';
import 'package:personal_web/screens/pages/skills/skills_mobile.dart';

void main() {
  // ignore: unused_local_variable
  MainController mainController = Get.put(MainController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nagendra Prajapati',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        fontFamily: 'Ubuntu',
      ),
      initialRoute: MainNavigationRoute,
      routes: {
        HomeRoute: (context) => LayoutWrapper(
              page: HomeSection(),
              mobilePage: HomeSectionMobile(),
                selectedPage: Pages.HOME,
            ),
        AboutRoute: (context) => LayoutWrapper(
              page: AboutSection(),
              mobilePage: AboutSectionMobile(),
              selectedPage: Pages.ABOUT,
            ),
        SkillsRoute: (context) => LayoutWrapper(
              page: SkillsSection(),
              mobilePage: SkillsSectionMobile(),
              selectedPage: Pages.SKILLS,
            ),
        PortfolioRoute: (context) => LayoutWrapper(
              page: PortfolioSection(),
              mobilePage: PortfolioSectionMobile(),
              selectedPage: Pages.PORTFOLIO,
            ),
          MainNavigationRoute: (context) => LayoutWrapper(
              page: MainNavigationPage(),
              mobilePage: MainNavigationPage(),
              selectedPage: Pages.HOME,
            )
      },
    );
  }
}
