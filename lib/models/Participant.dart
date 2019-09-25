import 'package:flutter/material.dart';

class Participant {
  String index, name, room;
  Participant({this.index, this.name, this.room});

  factory Participant.fromJSON(Map<String, dynamic> json) {
    return Participant(
      index: json['team_id'] as String,
      name: json['name'] as String,
      room: json['room'] as String,
    );
  }
}
