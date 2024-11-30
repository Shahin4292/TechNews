import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

import '../utils/text.dart';
import 'components.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageUrl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageUrl: imageUrl,
          title: title,
          description: description,
        ); // returns your BottomSheet widget
      });
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//your bottom sheet widget class
//you can put your things here, like buttons, callbacks and layout
class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageUrl, url;

  const MyBottomSheetLayout(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                  text: description, size: 16, color: Colors.white)),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Read Full Article',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchURL(url);
                        },
                      style: GoogleFonts.lato(
                        color: Colors.blue.shade400,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
