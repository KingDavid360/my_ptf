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
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xffFCDA69),
      child: ListView(
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
                    'Ongoing Project',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 46.29,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w800,
                    ),
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
                          'images/webapp_phone.png'),
                    ),
                    Flexible(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.5),
                                color: Color(0xff8873EF)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => launchUrl.launchURLBrowser(
                                      'https://github.com/KingDavid360/weather_app'),
                                  child: Text(
                                    'Weather app',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'A simple weather app that provides the hourly weather condition and temperature'
                                  'of your current location and also the daily day and night '
                                  'weather condition and temperature of your current location.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'Calibri',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
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
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.5),
                                color: Color(0xff8873EF)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => launchUrl.launchURLBrowser(
                                      'https://github.com/KingDavid360/country_app'),
                                  child: const Text(
                                    'Country app',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                const Text(
                                  'An application that displays all the countries of the world'
                                  ' and gives information about each country, such as the country flag,'
                                  'coat of arm, languages spoken in the country, currency, etc.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'Calibri',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                          height: size.height * 0.45,
                          'images/countryapp_phone.png'),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                MoreProjectsDesktop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
