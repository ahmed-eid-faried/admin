import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController {
  launchUrl(url) async {
    if (!await canLaunch(url.toString())) {
      throw Exception('Could not launch $url');
    } else {
      await launch(url.toString());
    }
  }

  launchTel() async {
    final Uri telUri = Uri(scheme: 'tel', path: '+201555663045');
    await launchUrl(telUri);
    update();
  }

  launchMail() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  launchSMS() async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: '+201555663045',
      queryParameters: {'body': ""}, // Updated variable name
    );
    await launchUrl(smsUri);
    update();
  }
}
