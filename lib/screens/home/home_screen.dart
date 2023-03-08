import 'package:flutter/material.dart';
import 'package:portfolio/components/screen_detector.dart';
import 'package:portfolio/screens/home/tablet_screen.dart';

import 'desktop_screen.dart';
import 'mobile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff2B3856),
      backgroundColor: Colors.black,
      body: screenDetector.isDesktop(context)
          ? DesktopScreen()
          : screenDetector.isMobile(context)
              ? MobileScreen()
              : screenDetector.isTablet(context)
                  ? MobileScreen()
                  : MobileScreen(),
    );
  }
}
