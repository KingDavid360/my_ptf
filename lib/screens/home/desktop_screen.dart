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
    AboutMeDesktop(),
    SkillsDesktop(),
    ContactMeDesktop()
  ];
  var sectionLists = [
    'Home',
    'Portfolio',
    'About me',
    'My Skills',
    'Contact Me',
  ];

  PageController controller = PageController();
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  5,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        _scrollToIndex(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Text(
                          sectionLists[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    );
                  },
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
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
