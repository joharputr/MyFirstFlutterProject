import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Main.dart';

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
          title: Text(
            "Android Studio",
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.directions_walk,
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.build),
              onPressed: () {
                _navigateToNextScreen(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF8C9EFF), Color(0xFFFF8A80)],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
                image: DecorationImage(
                    image: AssetImage("assets/rafan.jpeg"),
                    fit: BoxFit.none,
                    repeat: ImageRepeat.repeat)),
          ),
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
                  child: Image(
                image: AssetImage("assets/rafan.jpeg"),
                fit: BoxFit.fill,
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
