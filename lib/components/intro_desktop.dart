import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons.dart';

class IntroDesktop extends StatelessWidget {
  const IntroDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset('images/background.jpg',
            height: double.infinity, width: double.infinity),
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: ListView(
              children: [
                SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'ECHATAH KINGDAVID',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 40,
                                color: Colors.white),
                          ),
                          SizedBox(height: 50),
                          Text(
                            'I\'m a mobile app developer with flutter based in Nigeria',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 35,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 50),
                          Text(
                            'I\'m a passionate and curious software developer'
                            ' who is an enthusiast in solving problems. I build '
                            'cross platform application with flutter framework and dart programming language.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.white),
                          ),
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
