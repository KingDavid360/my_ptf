import 'package:flutter/material.dart';
import 'package:portfolio/components/about_me_desktop.dart';
import 'package:portfolio/components/contact_me_dektop.dart';
import 'package:portfolio/components/intro_desktop.dart';
import 'package:portfolio/components/portfolio_desktop.dart';
import 'package:portfolio/components/skills_desktop.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final List<Widget> screenSections = [
    IntroDesktop(),
    PortfolioDesktop(),
    SkillsDesktop(),
    AboutMeDesktop(),
    ContactMeDesktop()
  ];

  final List<String> sectionLists = [
    'HOME',
    'PORTFOLIO',
    'MY SKILLS',
    'ABOUT ME',
    'CONTACT ME',
  ];

  final PageController controller = PageController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: Column(
          children: [
            // Navigation Menu
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFF38BDF8),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              sectionLists[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
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

            // Page Content - Scrollbar will be aligned to edge of the screen
            Expanded(
              child: ScrollConfiguration(
                // This is the key change - removes default scrollbar and lets us define our own
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: Stack(
                  children: [
                    // Main Content
                    PageView(
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

                    // Custom Scrollbar
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 10,
                      child: Container(
                        color: Colors.transparent,
                        child: ListView(
                          controller: _scrollController,
                          children: [
                            // Empty container to allow interaction with scrollbar area
                            Container(
                              height: size.height * screenSections.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
    );
  }
}
