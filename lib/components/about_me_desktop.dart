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
          color: Colors.black,
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
                          color: Colors.white),
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
                            Text(
                              'My name is Echatah KingDavid, I am a flutter developer. I have a curious mind towards'
                              'life as a whole and that\'s what drives my problem solving skills. This also pushes me to develop'
                              'myself becasue I\'m always open to developing myself.'
                              '\n \nI began  programming with C programming language in 2020 from school then I went in with Java'
                              'bprogramming language which developed my skills with OOP. \n \n'
                              ' And I have been able to develop myself through involvement in challenging projects.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(right: size.width * 0.1),
                              child: InkWell(
                                  onTap: () => launchUrl.launchURLBrowser(
                                      'https://drive.google.com/file/d/1JVYTTVbpHRwRQgSVsUUVC2Ib76sxtHmC/view?usp=sharing'),
                                  child: Buttons(text: 'Download my CV')),
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
