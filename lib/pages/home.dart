import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/NoGlowScroll.dart';
import '../models/Participant.dart';
import '../Widgets/ParticipantTile.dart';

class HomePage extends StatelessWidget {
  List<Participant> list = <Participant>[
    Participant("#1", "Hack O Holics", "Seminar Hall 1"),
    Participant("#5", "404 Not Found", "Cafetaria"),
    Participant("#10", "C Sick", "Room - 004"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color(0xFF047B8C),
              Color(0xFF4138B2),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: <Widget>[
                RaisedButton(
                    child: Text("Logout"),
                    onPressed: () {
                      logoutUser();
                      Navigator.pushReplacementNamed(context, '/login');
                    }),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Participants",
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: "Kau",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowScroll(),
                    child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        print(list[index].index);
                        return ParticipantTile(list[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
