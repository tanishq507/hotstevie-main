import 'package:flutter/material.dart';
import 'package:hotstevie/screens/constants.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'webview.dart';
// import 'package:hotstevie/screens/constants.dart';

class HomePage2 extends StatelessWidget {
  final List<String> urls = [
    "https://resisted-cut-target.glitch.me/",
    "https://near-curved-gym.glitch.me/",
    "https://functional-burly-noise.glitch.me/",
    "https://hyper-fate-canvas.glitch.me/",
    "https://dashing-foam-nerve.glitch.me/",
    // Add more URLs as needed
  ];

  final List<String> buttonNames = [
    "Pikeaxe",
    "Sugarcane Plantation",
    "Watermelon Plantation",
    "Tractor ",
    "Cultivation Land",
    // Add more names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [Text('AR ACADEMY')],
      appBar: AppBar(
        title: Text("A R V I E W ", style: kHeadingStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: urls.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.0),
          itemBuilder: (context, index) {
            return ElevatedButton(
              child: Text(buttonNames[index],
                  style: kContainerTextStyle.copyWith(
                      fontWeight: kBoldFontWeight)),
              onPressed: () => _launchURL(urls[index]),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.black),
                ),
                padding: EdgeInsets.all(16.0),
                primary: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}

_launchURL(String _url) async {
  if (await launchUrl(Uri.parse(_url))) {
    await launchUrl(Uri.parse(_url));
  } else {
    throw 'Could not launch $_url';
  }
}
