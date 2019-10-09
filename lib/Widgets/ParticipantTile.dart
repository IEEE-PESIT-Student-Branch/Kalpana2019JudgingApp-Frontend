import 'package:flutter/material.dart';

import '../models/Participant.dart';
import '../models/ScoreArgs.dart';

class ParticipantTile extends StatelessWidget {
  Participant data;
  int round;
  TextStyle main = TextStyle(
    fontSize: 17,
    color: Colors.white,
  );
  TextStyle sub =
      TextStyle(fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.67));

  ParticipantTile({this.data,this.round});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xFF08284F),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: () {
          if(round==3){
          Navigator.pushNamed(context, '/home/scoring',
              arguments: ScoringArguments(title: data.name,teamid: data.index));
          }
          else{
            Navigator.pushNamed(context, '/home/mentor',
              arguments: ScoringArguments(title: data.name,teamid: data.index));
          }
        },
        title: Wrap(
          children: <Widget>[
            Text(
              data.name,
              style: main,
            ),
          ],
        ),
        leading: Text(
          data.index,
          style: sub,
        ),
        trailing: Text(data.room, style: sub),
      ),
    );
  }
}
