import 'package:flutter/material.dart';
// import 'package:kalpana2019judgingapp/pages/Jschedule.dart';
// import 'package:kalpana2019judgingapp/pages/login.dart';

import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/schedule.dart';
import 'pages/root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalpana 2019 Judging',
      initialRoute: '/',
      routes: {
        '/' : (context) => RootPage(),
        '/login': (context) => LoginPage(),
        '/schedule': (context) => SchedulePage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
