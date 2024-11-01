import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileView,
    required this.tabletView,
    required this.desktopView,
  }) : super(key: key);
  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
       var deviceWidth = MediaQuery.of(context).size.width;
      if (deviceWidth < 600) {
          return mobileView;
        } else if (deviceWidth >= 600 && deviceWidth < 900) {
          return tabletView;
        } else {
          return desktopView;
        }
    });
  }
}