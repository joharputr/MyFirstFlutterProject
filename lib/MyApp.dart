import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Design.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Android Studio"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              _navigateToNextScreen(context);
            },
            child: Container(
              color: Colors.red,
              width: 160.0 + random.nextDouble(),
              height: 150,
              child: Center(
                  child: Text(
                "apa lo coeg",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              )),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Design()));
  }
}
