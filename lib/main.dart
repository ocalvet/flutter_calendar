import 'package:flutter/material.dart';

void main() => runApp(CalendarApp());

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreen,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
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
