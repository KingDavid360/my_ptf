import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons.dart';
import 'package:portfolio/components/url_launcher.dart';

class PortfolioMobile extends StatelessWidget {
  PortfolioMobile({Key? key}) : super(key: key);

  LaunchUrl launchUrl = new LaunchUrl();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Portfolio',
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 30, color: Colors.white),
          ),
        ),
        SizedBox(height: 20),
        const Text(
          'Weather app',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),
        ),
        SizedBox(height: 10),
        Image.asset(height: size.height * 0.45, 'images/weather_app.png'),
        SizedBox(height: 10),
        const Text(
          'A simple weather app that provides the hourly weather condition and temperature'
          'of your current location and also the daily day and night '
          'weather condition and temperature of your current location.',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.grey),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.35),
          child: InkWell(
              onTap: () async {
                print('before click');
                await launchUrl.launchURLBrowser(
                    'https://github.com/KingDavid360/weather_app');
                print('after click');
              },
              child: Buttons(text: 'Documentation')),
        ),
        SizedBox(height: 30),
        const Text(
          'Country app',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),
        ),
        SizedBox(height: 10),
        Image.asset(height: size.height * 0.45, 'images/country_app.png'),
        SizedBox(height: 10),
        const Text(
          'An application that displays all the countries of the world'
          ' and gives information about each country, such as the country flag,'
          'coat of arm, languages spoken in the country, currency, etc.',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.grey),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.35),
          child: InkWell(
              onTap: () {
                launchUrl.launchURLBrowser(
                    'https://github.com/KingDavid360/Country_App');
              },
              child: Buttons(text: 'Documentation')),
        ),
      ],
    );
  }
}
