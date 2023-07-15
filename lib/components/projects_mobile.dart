import 'package:flutter/material.dart';
import 'package:portfolio/components/projects_container.dart';
import 'package:portfolio/components/url_launcher.dart';

class MoreProjectsMobile extends StatelessWidget {
  MoreProjectsMobile({Key? key}) : super(key: key);

  LaunchUrl launchUrl = new LaunchUrl();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          // height: double.infinity,
          height: 600,
          width: double.infinity,
          color: Color(0xffFCDA69),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                'More projects',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  launchUrl.launchURLBrowser(
                      'https://github.com/KingDavid360/tweeter');
                },
                child: const ProjectsContainer(
                  title: 'Twitter clone',
                  text:
                      'A clone of twitter app with flutter and firebase, which allows you perform the basic functionality of twitter'
                      ', which is, to create account, login, create tweet, like, comment, etc.',
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  launchUrl.launchURLBrowser(
                      'https://github.com/KingDavid360/abuad-footbal-league');
                },
                child: ProjectsContainer(
                  title: 'Fantasy football app design [private project]',
                  text:
                      'A design of the a fantasy football gaming app with flutter ',
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  launchUrl.launchURLBrowser(
                      'https://github.com/KingDavid360?tab=repositories');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View all projects on github',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
