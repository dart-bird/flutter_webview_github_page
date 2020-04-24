import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({this.initurl});
  final String initurl;
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  bool isBackPressed = false;
  bool canExit = false;
  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      print("current URL = $url");
      setState(() {
        isBackPressed = false;
      });
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // give chance to user to exit app
          //if (canExit == true) SystemNavigator.pop();
          if (isBackPressed == true) SystemNavigator.pop();
          if (await flutterWebViewPlugin.canGoBack() == true) {
            await flutterWebViewPlugin.goBack();
          } else {
            if (isBackPressed == false) {
              await Fluttertoast.showToast(
                msg: "앱을 종료하려면 한번 더 뒤로가기 해주세요.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.lightBlue,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
            setState(() {
              isBackPressed = true;
            });
          }
          return false;
        },
        child: SafeArea(
          child: WebviewScaffold(
            url: widget.initurl,
            scrollBar: false,
            hidden: true,
          ),
        ),
      ),
    );
  }
}
