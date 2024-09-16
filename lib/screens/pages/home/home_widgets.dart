import 'package:flutter/material.dart';
import 'package:personal_web/constants/colors.dart';
import 'package:personal_web/models/typewriter.dart';
import 'package:personal_web/models/url_helper.dart';

/// Introductory texts with the Hire Me button as well
class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction>
    with SingleTickerProviderStateMixin {
  static bool helloSeen = false;
  static bool nameSeen = false;
  static bool positionSeen = false;
  static bool abstractSeen = false;

  static bool showName = false;
  static bool showPosition = false;
  static bool showAbstract = false;
  static bool showHireMe = false;

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
            "Hey! I'm...",
            animate: !helloSeen,
            textStyle: TextStyle(
              color: kPrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
            ),
            onEnd: () {
              if (mounted) {
                setState(() {
                  showName = true;
                  helloSeen = true;
                });
              }
            },
          ),
          if (showName) ...[
            SizedBox(height: 16),
            Typewriter(
              'Nagendra Prajapati',
              animate: !nameSeen,
              textStyle: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    showPosition = true;
                    nameSeen = true;
                  });
                }
              },
            ),
          ],
          if (showPosition) ...[
            SizedBox(height: 16),
            Typewriter(
              'Mobile Application Developer',
              animate: !positionSeen,
              textStyle: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    showAbstract = true;
                    positionSeen = true;
                  });
                }
              },
            ),
          ],
          if (showAbstract) ...[
            SizedBox(height: 24),
            Typewriter(
              "I build neat, cool and scalable mobile apps with Flutter and I'm an aspiring deep learning engineer.\n"
              'I love to learn and build new stuff that are beneficial to the community and cool to work on.\n'
              'I also have great interest in the open source community.',
              animate: !abstractSeen,
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                letterSpacing: 1.2,
                height: 1.3,
              ),
              onEnd: () {
                Future.delayed(Duration(milliseconds: 500), () {
                  if (mounted) {
                    setState(() {
                      showHireMe = true;
                      abstractSeen = true;
                    });
                  }
                });
              },
            ),
          ],
          if (showHireMe) ...[
            SizedBox(height: 30),
            _HireMeButton(),
          ],
        ],
      ),
    );
  }
}

class _HireMeButton extends StatefulWidget {
  @override
  __HireMeButtonState createState() => __HireMeButtonState();
}

class __HireMeButtonState extends State<_HireMeButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        UrlHelper.launchUrl("mailto:nagendra.p95@gmail.com");
      },
      onHover: (value) {
        if (mounted) {
          setState(() {
            hovered = value;
          });
        }
      },
      child: AnimatedContainer(
        height: 50,
        width: 160,
        duration: kThemeAnimationDuration,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1.4, color: kPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: hovered ? kPrimaryColor.withOpacity(1.0) : Colors.transparent,
        ),
        child: AnimatedDefaultTextStyle(
          duration: kThemeAnimationDuration,
          style: TextStyle(
            color: hovered ? Colors.white : kPrimaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'Ubuntu',
          ),
          child: Text(
            'Hire Me',
          ),
        ),
      ),
    );
  }
}

class HeroImage extends StatefulWidget {
  final Color borderColor;
  final Color backgroundColor;
  final Color widgetColor;

  HeroImage({
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.widgetColor = Colors.white,
  });

  @override
  _HeroImageState createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> with TickerProviderStateMixin{
  bool? showLogo;
  late AnimationController _controller;

  wait() async {
    await Future.delayed(Duration(milliseconds: 250));
    setState(() {
      showLogo = !(showLogo ?? false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    showLogo = false;
    wait();
     _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showLogo ?? false ? 1 : 0,
      duration: Duration(milliseconds: 250),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final value = _controller.value;
          return Transform.translate(
             offset: Offset(0, 3 * value),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 300,
                height: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: Offset(0.0, 3.0)
                          ),
                        ],
                ),
               
                child: Image.asset(
                  'assets/images/profile_pic.png',
                  fit: BoxFit.cover,
                  // color: widget.widgetColor,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
