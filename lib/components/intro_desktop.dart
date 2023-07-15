import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons.dart';
import 'package:portfolio/components/url_launcher.dart';

class IntroDesktop extends StatelessWidget {
  IntroDesktop({Key? key}) : super(key: key);
  LaunchUrl launchUrl = LaunchUrl();
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
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: ListView(
              children: [
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Hello 👋🏾, I’m King David and I’m a',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 50),
                          const Text(
                            'Mobile Application \nDeveloper ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 80,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 50),
                          const Text(
                            'I’m a passionate and curious software developer who is ab enthusiast in solving problems .I build cross platform application with flutter and dart programming language ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27.22,
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 50),
                          InkWell(
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
                            ),
                          )
                          // SizedBox(height: 30),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: size.width * 0.2),
                          //   child: Buttons(text: 'Contact me'),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
