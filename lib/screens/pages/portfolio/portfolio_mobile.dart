import 'package:flutter/material.dart';
import 'package:personal_web/constants/colors.dart';
import 'package:personal_web/screens/pages/portfolio/portfolio_widgets.dart';

class PortfolioSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PortfolioManImage(true),
        // SizedBox(height: 32),
        Expanded(child: PortfolioContent(color: kPrimaryColor, isMobile: true)),
      ],
    );
  }
}
