import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  String label;

  ScoreSlider(this.label);
  @override
  _ScoreSliderState createState() => _ScoreSliderState();
}

class _ScoreSliderState extends State<ScoreSlider> {
  double _value = 5;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Expanded(
          child: Slider(
            divisions: 10,
            min: 0,
            max: 10,
            value: _value,
            onChanged: (x) {
              setState(
                () {
                  _value = x;
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            "${_value.round()}",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
