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
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ),
        Image.asset(
          'images/dark_background.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        ListView(
          controller: _scrollController,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello 👋🏾, I’m King David and I’m a',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Mobile Application \nDeveloper ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'I’m a passionate and curious software developer who is ab enthusiast in solving problems .I build cross platform application with flutter and dart programming language ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.35),
                    child: InkWell(
                      onTap: () => _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeIn,
                      ),
                      child: Container(
                        width: 268,
                        height: 72,
                        decoration: ShapeDecoration(
                          color: Color(0xFF8873EF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Contact me',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Suez One',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 80),
            PortfolioMobile(),
            MoreProjectsMobile(),
            SizedBox(height: 80),
            SkillsMobile(),
            SizedBox(height: 80),
            AboutMeMobile(),
            SizedBox(height: 80),
            ContactMobile(),
          ],
        ),
      ],
    );
  }
}
