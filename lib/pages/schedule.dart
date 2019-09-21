import 'package:flutter/material.dart';
import 'package:kalpana2019judgingapp/models/EventSchedule.dart';

class SchedulePage extends StatelessWidget {
  //List of the Events
  final List<EventSchedule> _events = [
    EventSchedule(event: '7:00 am - Registration'),
    EventSchedule(event: '8:00 am - Inagauration')
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF038396),
            Color(0xFF4138B2),
          ],
        )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Schedule',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Kau',
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                height: 70,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(
                  elevation: 6,
                  color: Color(0xFF08284F),
                  child: Container(
                    alignment: AlignmentDirectional(-0.8, 0.0),
                    child: Text(
                      '7:00 am - Registration',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(
                  elevation: 6,
                  color: Color(0xFF08284F),
                  child: Container(
                    alignment: AlignmentDirectional(-0.8, 0.0),
                    child: Text(
                      '8:00 am - Inagauration',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
