import 'package:flutter/material.dart';
import 'package:portfolio/components/screen_detector.dart';
import 'package:portfolio/components/url_launcher.dart';

import 'buttons.dart';

class AboutMeMobile extends StatelessWidget {
  AboutMeMobile({Key? key}) : super(key: key);
  LaunchUrl launchUrl = new LaunchUrl();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          // height: double.infinity,
          height: 1000,
          width: double.infinity,
          color: Color(0xffFCDA69),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'About Me',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(
                    right: screenDetector.isTablet(context)
                        ? size.width * 0.45
                        : size.width * 0.35),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    child: Image.asset(
                        height: screenDetector.isTablet(context)
                            ? size.width * 0.3
                            : size.width * 0.5,
                        fit: BoxFit.cover,
                        'images/profile_photo.jpeg'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              const Text(
                'My name is Echatah KingDavid, I am a flutter developer. I have a curious mind towards'
                ' life as a whole and that\'s what drives my problem solving skills. This also pushes me to develop'
                ' myself because I\'m always open to developing myself.'
                '\n \nI began  programming with C programming language in 2020 from school then I went in with Java'
                ' programming language which developed my skills with OOP. Then in 2022  I began with flutter and'
                ' and dart for mobile app development where I have gotten to an advanced level to build beautiful UI\'s. \n \n'
                ' And I have been able to develop myself through involvement in challenging projects.',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.3),
                child: InkWell(
                  onTap: () => launchUrl.launchURLBrowser(
                      'https://drive.google.com/file/d/1JVYTTVbpHRwRQgSVsUUVC2Ib76sxtHmC/view?usp=sharing'),
                  child: Container(
                    width: 270,
                    height: 72,
                    decoration: ShapeDecoration(
                      color: Color(0xFF8873EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Download my CV',
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
