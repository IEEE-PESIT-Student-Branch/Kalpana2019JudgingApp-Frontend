import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: WebView(
          initialUrl: 'http://192.168.1.2:8080/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
