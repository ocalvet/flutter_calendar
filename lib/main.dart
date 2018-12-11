import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(CalendarApp());

class CalendarApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalendarAppState();
  }
}

class CalendarAppState extends State<CalendarApp>
    with SingleTickerProviderStateMixin {
  AnimationController animation;
  final Tween<double> ratationTween = Tween<double>(begin: 0.0, end: 2 * pi);
  Color color = Colors.redAccent;
  List<Color> colors = [
    Colors.redAccent,
    Colors.amberAccent,
    Colors.yellowAccent,
    Colors.deepOrangeAccent
  ];
  Matrix4 rotaionTransform =  Matrix4.identity();

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    )
    ..repeat();
    var rand = Random(2356);
    Timer.periodic(Duration(seconds: 1), (timer) {
      this.setState(() {
        color = colors[rand.nextInt(4)];
        rotaionTransform = Matrix4.rotationZ(ratationTween.evaluate(animation));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Positioned(
                left: 100,
                top: 120,
                child: AnimatedContainer(
                  curve: Curves.ease,
                  transform: rotaionTransform,
                  color: color,
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  duration: Duration(seconds: 1),
                )),
            Positioned(
              left: 20,
              bottom: 30,
              child: Text(
                'DATA',
                textDirection: TextDirection.ltr,
              ),
            ),
            Positioned(
              left: 50,
              top: 200,
              child: Text(
                'Some other text',
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ));
  }
}
