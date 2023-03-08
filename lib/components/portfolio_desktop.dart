import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons.dart';
import 'package:portfolio/components/projects_desktop.dart';
import 'package:portfolio/components/url_launcher.dart';

class PortfolioDesktop extends StatelessWidget {
  PortfolioDesktop({Key? key}) : super(key: key);
  LaunchUrl launchUrl = new LaunchUrl();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              const Center(
                child: Text(
                  'Portfolio',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
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
                    child: Image.asset(
                        height: size.height * 0.45,
                        // width: size.width * 0.45,
                        'images/weather_app.png'),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weather app',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'A simple weather app that provides the hourly weather condition and temperature'
                          'of your current location and also the daily day and night '
                          'weather condition and temperature of your current location.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.12),
                          child: InkWell(
                              onTap: () => launchUrl.launchURLBrowser(
                                  'https://github.com/KingDavid360/weather_app'),
                              child: Buttons(text: 'Documentation')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country app',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'An application that displays all the countries of the world'
                          ' and gives information about each country, such as the country flag,'
                          'coat of arm, languages spoken in the country, currency, etc.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.12),
                          child: InkWell(
                              onTap: () => launchUrl.launchURLBrowser(
                                  'https://github.com/KingDavid360/country_app'),
                              child: Buttons(text: 'Documentation')),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                        height: size.height * 0.45, 'images/country_app.png'),
                  ),
                ],
              ),
              SizedBox(height: 100),
              MoreProjectsDesktop(),
            ],
          ),
        ),
      ],
    );
  }
}
