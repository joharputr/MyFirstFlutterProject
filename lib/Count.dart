import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Count(),
  ));
}

/*void main() {
  runApp(Count());
}*/

int number = 0;

class Count extends StatefulWidget {
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  String nama;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Coba Count")),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Hai coba font",
                  style: TextStyle(fontFamily: "CrashLandingBB", fontSize: 30),
                ),
              ),
              Text(
                number.toString(),
                style: TextStyle(fontSize: 20),
              ),
              RaisedButton(
                child: Text(
                  "tekan bos",
                  style: TextStyle(fontFamily: "Bangers-Regular"),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Design()),
                  );
                  setState(() {
                    number++;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
