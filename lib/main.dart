import 'package:flutter/foundation.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _htmlText = '';
  String _pageTitle = '';
  String _corsHeader = '';

  late TextEditingController _controller;

  Future<void> loadHtmlPage() async {
    final result = await http.get(Uri.parse('https://flutter.dev'));
    String cors = 'CORS Header: None';
    result.headers.forEach((key, value) {
      if (key == 'access-control-allow-origin') {
        cors = value;
      }
    });

    setState(() {
      _htmlText = result.body;
      _pageTitle = html_parser.parse(result.body).querySelector('h1')!.text;
      _corsHeader = cors;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'https://flutter.dev');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            _pageTitle,
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            _corsHeader,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Text(_htmlText),
          )),
          const Divider(
            thickness: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: loadHtmlPage,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color
                  ),
                  child: const Text(
                    "LOAD",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(kIsWeb
                  ? 'APPLICATION RUNNING ON WEB'
                  : 'APPLICATION RUNNING ON ${Platform.operatingSystem.toUpperCase()}'),
            ),
          ),
        ],
      ),
    );
  }
}

