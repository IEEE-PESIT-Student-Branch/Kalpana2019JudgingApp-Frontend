import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalpana2019judgingapp/Widgets/ScoreSlider.dart';
import 'package:http/http.dart' as http;

import '../models/ScoreArgs.dart';

class FinalScorePage extends StatelessWidget {
  List<ScoreSlider> sliders = [
    ScoreSlider("Problem Clarity"),
    ScoreSlider("Target Clarity"),
    ScoreSlider("Usefulness"),
    ScoreSlider("Usability"),
    ScoreSlider("Ease of Setup"),
    ScoreSlider("Feasibility"),
  ];

  String uid;

  @override
  Widget build(BuildContext context) {
    ScoringArguments args = ModalRoute.of(context).settings.arguments;
    getUid().then((uid) {
      this.uid = uid;
    });
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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          args.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: "Kau",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: sliders,
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("SUBMIT"),
                  color: Colors.yellow[300],
                  onPressed: () {
                    //Try to POST scores
                    double score = 0;
                    sliders.forEach((slider) {
                      score += slider.value;
                    });
                    print("Score = $score");
                    http.post(
                      "http://192.168.1.2:8080/scores",
                      body: {
                        'score': '$score',
                        'jid': uid,
                        'tid': args.teamid,
                      },
                    ).then((val) {
                      Navigator.pop(context);
                    });
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getUid() async {
    return (await FirebaseAuth.instance.currentUser()).uid;
  }
}
