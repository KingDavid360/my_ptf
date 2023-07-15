import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons.dart';
import 'package:portfolio/components/url_launcher.dart';

class PortfolioMobile extends StatelessWidget {
  PortfolioMobile({Key? key}) : super(key: key);

  LaunchUrl launchUrl = new LaunchUrl();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          // height: double.infinity,
          height: 1720,
          width: double.infinity,
          color: Color(0xffFCDA69),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Portfolio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 20),
              const Text(
                'Weather app',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                  // height: size.height * 0.45,
                  'images/webapp_phone.png'),
              SizedBox(height: 10),
              const Text(
                'A simple weather app that provides the hourly weather condition and temperature'
                'of your current location and also the daily day and night '
                'weather condition and temperature of your current location.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.w300,
                ),
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
                        'Documentation',
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
              SizedBox(height: 30),
              const Text(
                'Country app',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                  // height: size.height * 0.45,
                  'images/countryapp_phone.png'),
              SizedBox(height: 10),
              const Text(
                'An application that displays all the countries of the world'
                ' and gives information about each country, such as the country flag,'
                'coat of arm, languages spoken in the country, currency, etc.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.35),
                child: InkWell(
                  onTap: () {
                    launchUrl.launchURLBrowser(
                        'https://github.com/KingDavid360/Country_App');
                  },
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
                        'Documentation',
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
