import 'package:flutter/material.dart';
import 'package:kalpana2019judgingapp/Widgets/ScoreSlider.dart';
import 'package:http/http.dart' as http;

import '../models/ScoreArgs.dart';

class ScorePage extends StatelessWidget {
  List<ScoreSlider> sliders = [
    ScoreSlider("Feasibility"),
    ScoreSlider("Innovation"),
    ScoreSlider("Completeness"),
  ];

  @override
  Widget build(BuildContext context) {
    ScoringArguments args = ModalRoute.of(context).settings.arguments;
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
                  child: Text("SUBMIT"),
                  onPressed: () {
                    //Try to POST scores
                    print(sliders[0].value.round());
                    http.post("http://192.168.1.2:8080/scores",
                        body: {'score': '${sliders[0].value.round()}'});
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
