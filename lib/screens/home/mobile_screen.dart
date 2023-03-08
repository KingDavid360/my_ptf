import 'package:flutter/material.dart';
import 'package:portfolio/components/about_me_mobile.dart';
import 'package:portfolio/components/buttons.dart';
import 'package:portfolio/components/contact_mobile.dart';
import 'package:portfolio/components/portfolio_mobile.dart';
import 'package:portfolio/components/projects_mobile.dart';
import 'package:portfolio/components/skills_mobile.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, top: 20),
        child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                const Text(
                  'ECHATAH KINGDAVID',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 35,
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
                  ' who is an enthusiast in solving problems. I build '
                  'cross platform application with flutter framework and dart programming language.',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.35),
                  child: InkWell(
                      onTap: () => _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.easeIn,
                          ),
                      child: Buttons(text: 'Contact me')),
                )
              ],
            ),
            SizedBox(height: 100),
            PortfolioMobile(),
            SizedBox(height: 50),
            MoreProjectsMobile(),
            SizedBox(height: 100),
            AboutMeMobile(),
            SizedBox(height: 100),
            SkillsMobile(),
            SizedBox(height: 100),
            ContactMobile(),
          ],
        ),
      ),
    );
  }
}
