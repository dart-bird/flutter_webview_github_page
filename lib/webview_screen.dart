import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({this.initurl});
  final String initurl;
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebView(
        initialUrl: widget.initurl,
        javascriptMode: JavascriptMode.unrestricted,
        // javascriptChannels: jsChannels,
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
      ),
    ));
  }
}
