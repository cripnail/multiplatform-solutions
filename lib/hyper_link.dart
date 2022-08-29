import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperLink extends StatelessWidget {
  final String link;

  const HyperLink({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text(link,
            style: const TextStyle(
                decoration: TextDecoration.underline, color: Colors.blue)),
      ),
      onTap: () {
        launch(link);
      },
    );
  }
}
