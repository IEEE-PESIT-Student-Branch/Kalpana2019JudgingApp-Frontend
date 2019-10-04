import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalpana2019judgingapp/Widgets/ScoreSlider.dart';
import 'package:http/http.dart' as http;

import '../models/ScoreArgs.dart';

class ScorePage extends StatelessWidget {
  List<ScoreSlider> sliders = [
    ScoreSlider("Synergy"),
    ScoreSlider("Planning"),
    ScoreSlider("Participative"),
    ScoreSlider("Discussions"),
    ScoreSlider("Prior Work"),
    ScoreSlider("Originality"),
    ScoreSlider("Integrations"),
    ScoreSlider("Change Management"),
    ScoreSlider("Team Motivation"),
    ScoreSlider("Time Management"),
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 10),
                    child: RaisedButton(
                      shape: ContinuousRectangleBorder(),
                      child: Text("SUBMIT"),
                      onPressed: () {
                        //Try to POST scores
                        double score = 0;
                        sliders.forEach((slider) {
                          score += slider.value;
                        });
                        print("Score = $score");
                        http.post(
                          "http://kalpana2019judgingapp.herokuapp.com/scores",
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
                  ),
                ],
              ),
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
