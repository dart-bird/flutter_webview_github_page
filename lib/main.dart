import 'package:flutter/material.dart';
import 'package:github_webview/webview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github Page WebView',
      home: WebViewScreen(
        initurl: 'https://krumaska.github.io',
      ),
    );
  }
}
