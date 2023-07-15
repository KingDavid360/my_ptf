import 'package:flutter/material.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
      child: Stack(
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
                  const Center(
                    child: Text(
                      'My Skills',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 46.29,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/flutter_logo.png',
                              height: 80,
                              width: 50,
                            ),
                            const Text(
                              'Flutter',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.44,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/dart_logo.png',
                              height: 80,
                              width: 50,
                            ),
                            const Text(
                              'Dart',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.44,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/firebase_logo.png',
                              height: 80,
                              width: 80,
                            ),
                            const Text(
                              'Firebase',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.44,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/dj.png',
                              height: 80,
                              width: 80,
                            ),
                            const Text(
                              'Django',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.44,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/python.png',
                              height: 80,
                              width: 80,
                            ),
                            const Text(
                              'Python',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.44,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/git_logo.png',
                              height: 80,
                              width: 80,
                            ),
                            const Text(
                              'Git',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.44,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
