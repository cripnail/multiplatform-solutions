// import 'dart:html';
// import 'dart:math';
// import 'package:flutter/foundation.dart';
//
// import 'package:flutter/cupertino.dart';
//
// class HtmlWebView extends StatelessWidget {
//   const HtmlWebView({Key? key, required this.link}) : super(key: key);
//   final String link;
//
//   @override
//   Widget build(BuildContext context) {
//     final id = Random().nextInt.toString();
//     ui.PlatformViewRegistry.registerViewFactory(
//         id, (int viewId) => IFrameElement()..src = link);
//     return HtmlElementView(viewType: id);
//   }
// }
