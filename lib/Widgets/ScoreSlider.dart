import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  String label;
  double value;

  ScoreSlider(this.label){
    this.value = 5;
  }
  @override
  _ScoreSliderState createState() => _ScoreSliderState();
}

class _ScoreSliderState extends State<ScoreSlider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            value: widget.value,
            onChanged: (x) {
              setState(
                () {
                  widget.value = x;
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            "${widget.value.round()}",
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
