import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:personal_web/constants/colors.dart';
import 'package:personal_web/constants/types.dart';
import 'package:personal_web/controllers/main-controller.dart';
import 'package:personal_web/models/change-page.dart';
import 'package:personal_web/models/url_helper.dart';
import 'package:personal_web/screens/shared/navbar/item.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  Pages selectedPage;
  Function(Pages) onNavSelected;
  Navbar({required this.selectedPage, required this.onNavSelected});

  final textStyle = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  final items = [
    'Home',
    'About',
    'Skills',
    'Portfolio',
    // 'Projects',
    'Resume',
  ];

  final pages = [
    Pages.HOME,
    Pages.ABOUT,
    Pages.SKILLS,
    Pages.PORTFOLIO,
    Pages.RESUME
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return Container(
        height: 72,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      radius: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'assets/images/profile_pic.png',
                          fit: BoxFit.cover,
                        ),
                      )),
                  SizedBox(width: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Nagendra ',
                      style: textStyle.copyWith(
                        color: Colors.black.withOpacity(0.75),
                        fontSize: 18,
                        fontFamily: 'Ubuntu',
                      ),
                      children: [
                        TextSpan(
                          text: 'Prajapati',
                          style: textStyle.copyWith(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items.map((item) {
                  return InkWell(
                      onTap: () async {
                        switch (item) {
                          case 'Home':
                            if (selectedPage != Pages.HOME) {
                              onNavSelected(Pages.HOME);
                              //  /changePage(context, Pages.HOME);
                            }
                            break;
                          case 'About':
                            if (selectedPage != Pages.ABOUT) {
                              onNavSelected(Pages.ABOUT);
                              // changePage(context, Pages.ABOUT);
                            }
                            break;
                          case 'Skills':
                            if (selectedPage != Pages.SKILLS) {
                              onNavSelected(Pages.SKILLS);
                              // changePage(context, Pages.SKILLS);
                            }
                            break;
                          case 'Portfolio':
                            if (selectedPage != Pages.PORTFOLIO) {
                              onNavSelected(Pages.PORTFOLIO);
                              // changePage(context, Pages.PORTFOLIO);
                            }
                            break;
                          case 'Resume':
                            final Uri uri = Uri.parse(
                                'https://drive.google.com/file/d/1HwbM3Tq7jX5JI1Ypuijg8oUzk9YBaGjD/view?usp=drive_link');
                            if (await canLaunchUrl(uri)) {
                              launchUrl(uri);
                            }
                            break;
                          case 'Skills':
                            if (selectedPage != Pages.SKILLS) {
                              onNavSelected(Pages.SKILLS);
                              // changePage(context, Pages.PORTFOLIO);
                            }
                            break;
                          default:
                        }
                      },
                      child: item == 'Resume'
                          ? ResumeButton()
                          : NavbarItem(
                              item: pages[items.indexOf(item)],
                              itemName: item,
                              selectedPage: selectedPage));
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ResumeButton extends StatefulWidget {
  @override
  _ResumeButtonState createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<ResumeButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () async {
        final Uri uri = Uri.parse(
            'https://drive.google.com/file/d/1HwbM3Tq7jX5JI1Ypuijg8oUzk9YBaGjD/view?usp=drive_link');
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        }
        // UrlHelper.downloadResume();
      },
      onHover: (value) {
        if (mounted) {
          setState(() {
            hovered = value;
          });
        }
      },
      child: AnimatedContainer(
        height: 40,
        duration: kThemeAnimationDuration,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: hovered ? Colors.white.withOpacity(0.92) : kPrimaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          duration: kThemeAnimationDuration,
          style: TextStyle(
            color: hovered ? kPrimaryColor : Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'Ubuntu',
          ),
          child: Text(
            'Download CV',
          ),
        ),
      ),
    );
  }
}
