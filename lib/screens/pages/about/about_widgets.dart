import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:personal_web/constants/colors.dart';
import 'package:personal_web/models/typewriter.dart';

class AboutManImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UnDraw(
      color: kPrimaryColor,
      illustration: UnDrawIllustration.programming,
      placeholder: Text(
        "Illustration is loading...",
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 20,
        ),
      ),
      errorWidget: Icon(Icons.error_outline, color: kPrimaryColor, size: 50),
    );
  }
}

class AboutContent extends StatefulWidget {
  final Color color;
  final bool isMobile;

  const AboutContent({this.color = Colors.white, this.isMobile = false});
  @override
  _AboutContentState createState() => _AboutContentState();
}

class _AboutContentState extends State<AboutContent>
    with TickerProviderStateMixin {
  static bool showAbout = false;
  static bool showStack1 = false;
  static bool showStack2 = false;

  static bool whoSeen = false;
  static bool aboutSeen = false;
  static bool stack1Seen = false;
  static bool stack2Seen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      // vsync: this,
      duration: kThemeAnimationDuration,
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Typewriter(
            'Who am I?',
            animate: !whoSeen,
            duration: const Duration(seconds: 1),
            textStyle: TextStyle(
              color: widget.color,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
            ),
            onEnd: () {
              if (mounted) {
                setState(() {
                  showAbout = true;
                  whoSeen = true;
                });
              }
            },
          ),
          Container(
            width: 60,
            height: 2,
            margin: const EdgeInsets.only(top: 4, bottom: 16),
            color: widget.color,
          ),
          // if (showAbout)
          Typewriter(
            "Hello! I'm Nagendra Prajapati, Lead Flutter developer.\n\n"
            "I love to create performant and interesting stuff that are beneficial to the community.\n"
            "I enjoy learning and exploring new areas in the technologies I work with and even the ones outside my stack.\n\n",
            //"Currently I am working with Dart, Python and Framework languages.",
            // animate: !aboutSeen,
            animate: false,
            duration: const Duration(seconds: 10),
            textStyle: TextStyle(
              color: widget.color,
              fontSize: 16,
              letterSpacing: 1.2,
              height: 1.3,
            ),
            onEnd: () {
              if (mounted) {
                setState(() {
                  showStack1 = true;
                  aboutSeen = true;
                });
              }
            },
          ),
          // if (showStack1)
          ...[
            SizedBox(height: 54),
            Typewriter(
              'Experience',
              // animate: !stack1Seen,
              animate: false,
              duration: const Duration(seconds: 2),
              textStyle: TextStyle(
                color: widget.color,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    showStack2 = true;
                    stack1Seen = true;
                  });
                }
              },
            ),
            Container(
              width: 60,
              height: 2,
              margin: const EdgeInsets.only(top: 4, bottom: 16),
              color: widget.color,
            ),
            // if (showStack2)
            Text(
              'LTIMindtree (05/2022 - Till Now):',
              style: TextStyle(
                color: widget.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.3,
              ),
            ),
            Typewriter(
              'Baptist Health Florida is a healthcare app enabling features like in-person and virtual appointment scheduling, urgent care, bill payment, diagnostics, and prescription renewals. Built with Agile methodology, the app is managed through Jira and GitLab for code maintenance and release on Play Store and App Store. Key contributions include integrating deep links, developing various appointment flows (e.g., Primary Care, Ortho), achieving 100% test coverage, and adding features like push notifications and the GYANT chat assistant. I also actively supported team members, helping resolve technical challenges effectively.',
              // animate: !stack2Seen,
              animate: false,
              duration: const Duration(seconds: 6),
              textStyle: TextStyle(
                color: widget.color,
                fontSize: 14,
                letterSpacing: 1.2,
                height: 1.3,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    stack2Seen = true;
                  });
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Infibeam Avenues (04/2021 - 05/2022):',
              style: TextStyle(
                color: widget.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.3,
              ),
            ),
            Typewriter(
              'I develop and maintain Flutter and React Native SDKs for mobile payments, supporting credit cards, UPI, and more, with each release including documentation. I assist merchants in SDK implementation and collaborate with developers, managing version control and app releases. My projects also include hotel and QR scan apps, and I integrate Firebase, Google, and Facebook services.',
              // animate: !stack2Seen,
              animate: false,
              duration: const Duration(seconds: 6),
              textStyle: TextStyle(
                color: widget.color,
                fontSize: 15,
                letterSpacing: 1.2,
                height: 1.3,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    stack2Seen = true;
                  });
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Inventifweb LLP (08/2018 - 04/2021):',
              style: TextStyle(
                color: widget.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.3,
              ),
            ),
            Typewriter(
              'I developed mobile applications using Dart, Flutter, HTML, JavaScript, and PHP, creating RESTful APIs and implementing tailored client solutions. Key features designed include QR scanning, graphing, offline data storage, and image filtering. I integrated third-party libraries like Firebase, Paytm, and Google Maps to enhance functionality and deployed software for both Android and iOS platforms.',
              // animate: !stack2Seen,
              animate: false,
              duration: const Duration(seconds: 6),
              textStyle: TextStyle(
                color: widget.color,
                fontSize: 15,
                letterSpacing: 1.2,
                height: 1.3,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    stack2Seen = true;
                  });
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Shambhav Infotech Pvt Ltd (08/2017 - 08/2018):',
              style: TextStyle(
                color: widget.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.3,
              ),
            ),
            Typewriter(
              'I developed native Android applications using Java, XML, JSON, and Android Studio, and iOS applications using Swift. I applied techniques to identify and resolve bugs, enhancing app functionality. Additionally, I integrated third-party APIs for seamless access to cloud data and optimized location-based features for a better user experience.',
              // animate: !stack2Seen,
              animate: false,
              duration: const Duration(seconds: 6),
              textStyle: TextStyle(
                color: widget.color,
                fontSize: 15,
                letterSpacing: 1.2,
                height: 1.3,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    stack2Seen = true;
                  });
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Techtry solutions Pvt Ltd (12/2016 - 07/2017):',
              style: TextStyle(
                color: widget.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.3,
              ),
            ),
            Typewriter(
              'I wrote clean code in Java and XML, optimized layouts, and contributed to design planning. Developed features like live tracking, geofencing, and security, while integrating Google Maps, Place API, Route API, Facebook, and Firebase.',
              // animate: !stack2Seen,
              animate: false,
              duration: const Duration(seconds: 6),
              textStyle: TextStyle(
                color: widget.color,
                fontSize: 15,
                letterSpacing: 1.2,
                height: 1.3,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    stack2Seen = true;
                  });
                }
              },
            ),
            const SizedBox(height: 50,)
          ],
        ],
      ),
    );
  }
}
