import 'package:flutter/material.dart';
import 'package:kalpana2019judgingapp/pages/Jschedule.dart';
//import 'pages/login.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Kalpana 2019 Judging',
      initialRoute: '/',
      routes: {
        '/': (context) => Jschedule(),
        '/home': (context) => HomePage()
      },
    );
  }
}