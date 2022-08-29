import 'dart:html';
import 'dart:math';
import 'package:universal_ui/universal_ui.dart';
import 'package:flutter/cupertino.dart';

Widget webView(String link) => WebPlatformWebView(link: link);

class WebPlatformWebView extends StatelessWidget {
  const WebPlatformWebView({Key? key, required this.link}) : super(key: key);
  final String link;

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    ui.platformViewRegistry.registerViewFactory(
        id, (int viewId) => IFrameElement()..src = link);
    return HtmlElementView(viewType: id);
  }
}
