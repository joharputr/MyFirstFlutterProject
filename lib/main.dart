import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Android Studio"),
        ),
        body: Center(
          child: Container(
            color: Colors.red,
            width: 120,
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
    );




  }
}
