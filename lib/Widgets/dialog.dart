import 'package:flutter/material.dart';

class LoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Connecting..."),
          ),
        ],
      ),
    );
  }
}
