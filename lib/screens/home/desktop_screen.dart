import 'package:flutter/material.dart';
import 'package:portfolio/components/about_me_desktop.dart';
import 'package:portfolio/components/contact_me_dektop.dart';
import 'package:portfolio/components/intro_desktop.dart';
import 'package:portfolio/components/portfolio_desktop.dart';

import '../../components/skills_desktop.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  var screenSections = [
    IntroDesktop(),
    PortfolioDesktop(),
    SkillsDesktop(),
    AboutMeDesktop(),
    ContactMeDesktop()
  ];
  var sectionLists = [
    'HOME',
    'PORTFOLIO',
    'MY SKILLS',
    'ABOUT ME',
    'CONTACT ME',
  ];

  PageController controller = PageController();
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Color(0xffFCDA69),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        5,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              _scrollToIndex(index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                margin: EdgeInsets.all(8),
                                child: Text(
                                  sectionLists[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                controller: controller,
                children: List.generate(
                  screenSections.length,
                  (index) {
                    return Container(
                      width: size.width,
                      height: double.maxFinite,
                      child: screenSections[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
