import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/NoGlowScroll.dart';
import '../models/Participant.dart';
import '../Widgets/ParticipantTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Participant> list = <Participant>[
    Participant(index: "#1", name: "Hack O Holics", room: "Seminar Hall 1"),
    Participant(index: "#5", name: "404 Not Found", room: "Cafetaria"),
    Participant(index: "#10", name: "C Sick", room: "Room - 004"),
  ];

  String uid = "";

  int round;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
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
                Stack(
                  children: <Widget>[
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
                    Positioned(
                      right: 15,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          logoutUser();
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowScroll(),
                    child: FutureList(sendRequest, round),
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

  Future<List<Participant>> sendRequest() async {
    // while(uid.isEmpty);
    uid = await getUid();
    final res =
        await http.get('http://kalpana2019judgingapp.herokuapp.com/teams/$uid');
    final x = parseRequest(res.body);
    return x;
  }

  List<Participant> parseRequest(String response) {
    final decode = json.decode(response);
    round = decode['round'];
    final parsed = decode['teams'].cast<Map<String, dynamic>>();
    return parsed
        .map<Participant>((json) => Participant.fromJSON(json))
        .toList();
  }

  Future<String> getUid() async {
    return (await FirebaseAuth.instance.currentUser()).uid;
  }
}

class FutureList extends StatefulWidget {
  Function sendRequest;
  int round;

  FutureList(this.sendRequest, this.round);
  @override
  _FutureListState createState() => _FutureListState();
}

class _FutureListState extends State<FutureList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Participant>>(
      future: widget.sendRequest(),
      builder: (context, snapshot) {
        print("Snapshot: ${snapshot}");
        if (snapshot.hasError) {
          print("Error Occured");
        }
        return snapshot.hasData
            ? (snapshot.data.length > 0
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ParticipantTile(
                        data: snapshot.data[index],
                        round: widget.round,
                      );
                    },
                  )
                : Center(
                    child: Wrap(
                      children: [
                        Text(
                          "Great! You're done judging all teams!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ))
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
