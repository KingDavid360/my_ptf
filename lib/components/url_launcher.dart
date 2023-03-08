import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  launchURLBrowser(String urlLink) async {
    var url = Uri.parse(urlLink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
