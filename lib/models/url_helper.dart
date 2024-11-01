// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlHelper {
  static Future<void> launchUrl(String url) async {
    if (await url_launcher.canLaunchUrl(Uri.parse(url))) {
      await url_launcher.launchUrl(Uri.parse(url));
    }
  }

  static Future viewResume() async {
    final url =
        'https://avtechky.in/nagendra/resume/nagendra.pdf';
    final Uri uri = Uri.parse(url);
    if (await url_launcher.canLaunchUrl(uri)) {
      url_launcher.launchUrl(uri);
    }
  }

  static Future<void> downloadResume() async {
    final readValue = await rootBundle.load('assets/DKB_CV.pdf');

    // Call the "saveAs" method from the FileSaver.js libray
    js.context.callMethod("saveAs", [
      html.Blob([readValue]),
      "DKB Resume.pdf",
    ]);
  }
}
