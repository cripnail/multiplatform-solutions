import 'package:flutter/cupertino.dart';
import 'package:multi_platform/app_platform.dart';
import 'package:multi_platform/hyper_link.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView(String link) => AppPlatform.isMobile
    ? const WebView(initialUrl: 'https://flutter.dev/')
    : const HyperLink(link: 'https://flutter.dev/');
