import 'package:flutter/material.dart';
import 'package:portfolio/components/url_launcher.dart';

import 'buttons.dart';

class AboutMeDesktop extends StatelessWidget {
  AboutMeDesktop({Key? key}) : super(key: key);

  LaunchUrl launchUrl = new LaunchUrl();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Color(0xffFCDA69),
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: const Text(
                      'About Me',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              child: Image.asset(
                                  height: size.width * 0.2,
                                  fit: BoxFit.cover,
                                  'images/profile_photo.jpeg'),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const Text(
                              'My name is Echatah KingDavid, I am a flutter developer. I have a curious mind towards'
                              ' life as a whole and that\'s what drives my problem solving skills. This also pushes me to develop'
                              ' myself because I\'m always open to developing myself.'
                              '\n \nI began  programming with C programming language in 2020 from school then I went in with Java'
                              ' programming language which developed my skills with OOP. Then in 2022  I began with flutter and'
                              ' and dart for mobile app development where I have gotten to an advanced level to build beautiful UI\'s. \n \n'
                              ' And I have been able to develop myself through involvement in challenging projects.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.89,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(right: size.width * 0.1),
                              child: InkWell(
                                  onTap: () => launchUrl.launchURLBrowser(
                                      'https://drive.google.com/file/d/19MDCEyuicysa3X28GAOtSY0ir7cuKyRk/view?usp=sharing'),
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
                                        'DOWNLOAD CV',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Suez One',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
