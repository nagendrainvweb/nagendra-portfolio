import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_web/constants/colors.dart';
import 'package:personal_web/constants/types.dart';
import 'package:personal_web/controllers/main-controller.dart';
import 'package:personal_web/models/change-page.dart';
import 'package:personal_web/screens/shared/nav_bar.dart';
import 'package:personal_web/models/url_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  Pages selectedPage;
  AppDrawer({required this.selectedPage,});

  final textStyle = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  final items = [
    'Home',
    'About',
    'Skills',
    // 'Experience',
    'Portfolio',
    'Resume',
  ];

    final page = [
    Pages.HOME,
    Pages.ABOUT,
    Pages.SKILLS,
    Pages.PORTFOLIO,
    Pages.RESUME
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  GetX<MainController>(
        builder: (controller) {
          return Container(
            color: kPrimaryColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 8,
                  top: 8,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Column(
                  children: [
                    // Container(
                    //   height: 100,
                    //   width: 100,
                    //   margin: EdgeInsets.only(top: 75),
                    //   child: Image.asset(
                    //     'assets/images/logo/me.png',
                    //     color: Color(0xfffafafa),
                    //   ),
                    // ),
                          //           CircleAvatar(
                          // backgroundColor: kPrimaryColor,
                          // radius: 15,
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(40),
                          //   child: Image.asset(
                          //     'assets/images/profile_pic.png',
                          //     fit: BoxFit.cover,
                          //   ),
                          // )
                          // ),
                  ],
                ), 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: items.map((item) {
                    return InkWell(
                      onTap: () async{
                        switch (item) {
                            case 'Home':
                              if (controller.selectedPage.value != Pages.HOME) {
                                changePage(context,Pages.HOME);
                              }
                              break;
                            case 'About':
                              if (controller.selectedPage.value != Pages.ABOUT) {
                                changePage( context,Pages.ABOUT);
                              }
                              break;
                            case 'Skills':
                              if (controller.selectedPage.value != Pages.SKILLS) {
                                changePage(context,Pages.SKILLS);
                              }
                              break;
                            case 'Portfolio':
                              if (controller.selectedPage.value != Pages.PORTFOLIO) {
                                changePage(context,Pages.PORTFOLIO);
                              }
                              break;
                            case 'Resume':
                           UrlHelper.viewResume();
                              break;
                            case 'Skills':
                              break;
                            default:
                          
                        }
          
                        Navigator.pop(context);
                      },
                      child: item == 'Resume'
                          ? SizedBox(width: 160, child: ResumeButton())
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item,
                                  style: textStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: textStyle.color?.withOpacity(
                                      controller.selectedPage.value == page[items.indexOf(item)]
                                          ? 1.0
                                          : 0.75,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                if (item != 'Resume')
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 2,
                                    width: 20,
                                    color: controller.selectedPage.value == page[items.indexOf(item)]
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                SizedBox(height: 20),
                              ],
                            ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
