import 'package:flutter/material.dart';
import 'package:portfolio/components/projects_container.dart';
import 'package:portfolio/components/url_launcher.dart';

class MoreProjectsDesktop extends StatelessWidget {
  MoreProjectsDesktop({Key? key}) : super(key: key);
  LaunchUrl launchUrl = LaunchUrl();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'More projects',
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () => launchUrl.launchURLBrowser(
                    'https://github.com/KingDavid360/tweeter'),
                child: const ProjectsContainer(
                  title: 'Twitter clone',
                  text:
                      'A clone of twitter app with flutter and firebase, which allows you perform the basic functionality of twitter'
                      ', which is, to create account, login, create tweet, like, comment, etc.',
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () => launchUrl.launchURLBrowser(
                    'https://github.com/KingDavid360/abuad-footbal-league'),
                child: const ProjectsContainer(
                  title: 'Fantasy football app design [private project] ',
                  text:
                      'A design of the a fantasy football gaming app with flutter ',
                ),
              ),
            )
          ],
        ),
        // SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Center(
            child: InkWell(
              onTap: () => launchUrl.launchURLBrowser(
                  'https://github.com/KingDavid360?tab=repositories'),
              child: const Text(
                'View all projects on github',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
