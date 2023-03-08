import 'package:flutter/material.dart';
import 'package:portfolio/components/screen_detector.dart';

import '../../components/about_me_mobile.dart';
import '../../components/portfolio_mobile.dart';

class TabletScreen extends StatefulWidget {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  State<TabletScreen> createState() => _TabletScreenState();
}

class _TabletScreenState extends State<TabletScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, top: 20),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.6),
              child: ClipOval(
                child: SizedBox.fromSize(
                  child: Image.asset(
                      height: size.width * 0.35,
                      fit: BoxFit.cover,
                      'images/profile_photo.jpeg'),
                ),
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'ECHATAH KINGDAVID',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            const Text(
              'I\'m a mobile app developer based in Nigeria',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.grey),
            ),
            SizedBox(height: 10),
            const Text(
              'I\'m a passionate and curious software developer'
              ' who is an enthusiast in solving problems. ',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            ),
            SizedBox(height: 100),
            PortfolioMobile(),
            SizedBox(height: 100),
            AboutMeMobile(),
          ],
        ),
      ),
    );
  }
}
