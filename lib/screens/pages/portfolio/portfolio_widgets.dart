import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:personal_web/constants/colors.dart';
import 'package:personal_web/models/hover_builder.dart';
import 'package:personal_web/models/portfolio_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioManImage extends StatelessWidget {
  final bool isMobile;
  const PortfolioManImage(this.isMobile);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isMobile ? 0 : 150),
      child: Image.asset(
        'assets/images/portfolio.png',
        height: 450,
      ),
    );
  }
}

class PortfolioContent extends StatefulWidget {
  final Color color;
  final bool isMobile;

  const PortfolioContent({this.color = Colors.white, this.isMobile = false});
  @override
  _PortfolioContentState createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent>
    with TickerProviderStateMixin {
  static bool showPortfolio = false;
  static bool portfolioSeen = false;
  static bool whatSeen = false;
  static double? space, widthSpace;

  List? portfolio;
  List? scores;
  int? showSpeed, portfolioNumber;

  @override
  void initState() {
    super.initState();
    space = 30;
    widthSpace = 50;
    showSpeed = 750;
    portfolioNumber = -2;
    portfolio = [
      'Flutter',
      'Python',
      'Dart',
      'PHP',
      'Git',
      'Linux',
      'HTML',
      'MySQL',
      'Regex',
      'JSON'
    ];

    scores = [90.0, 80.0, 85.0, 60.0, 90.0, 85.0, 75.0, 80.0, 75.0, 85];
    endPage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSize(
        duration: kThemeAnimationDuration,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GridView.builder(
            itemCount: PortfolioData.getPortfolioList().length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              childAspectRatio: 0.9,
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
            itemBuilder: (context, index) {
              PortfolioData data = PortfolioData.getPortfolioList()[index];
              return HoverBuilder(
                builder: (isHover) {
                  return Card(
                    elevation: 6,
                    color: kPrimaryColor.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  // color: Colors.white,
                                  child: Image.asset(
                                    data.imageUrl ?? '',
                                    height: size.height * 0.25,
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data.title ?? '',
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            data.desc ?? '',
                                            maxLines: 4,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12.0,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //  Text(
                              //         data.type ?? '',
                              //         style: TextStyle(
                              //             fontSize: 14.0, color: Colors.white70),
                              //       ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isHover,
                          child: InkWell(
                            child: Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(14)
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: ()async {
                                    final uri = Uri.parse(data.link ?? '');
                                    if(await canLaunchUrl(uri)){
                                      launchUrl(uri);
                                    }
                                  },
                                  icon: Icon(
                                    Bootstrap.github,
                                    size: 60,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
            },
          ),
        ));
  }

  endPage() async {
    await Future.delayed(Duration(
        milliseconds: ((portfolio?.length ?? 0) + 1) * 3 * (showSpeed ?? 1)));
    setState(() {
      portfolioSeen = true;
    });
  }

  Widget sizedBox(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
