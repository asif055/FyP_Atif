import 'package:jobportal/UI/base_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicantsVM extends BaseViewModel {
  Future<void> makePhoneCall(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
