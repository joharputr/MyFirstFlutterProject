import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Design());

class Design extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Icon(Icons.star, color: Colors.green),
    Icon(Icons.star, color: Colors.red[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.black),
  ],
);

final Ratings = Container(
  margin: EdgeInsets.only(bottom: 10),
  child: Column(
    children: <Widget>[
      stars,
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Text(
          "170 Reviews",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 10),
        ),
      )
    ],
  ),
);

final descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2);

final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.kitchen, color: Colors.green[500]),
              Text(
                'PREgP:',
                style: TextStyle(fontSize: 10),
              ),
              Text('25 min', style: TextStyle(fontSize: 10)),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.kitchen, color: Colors.green[500]),
              Text(
                'PREgP:',
                style: TextStyle(fontSize: 10),
              ),
              Text('25 min', style: TextStyle(fontSize: 10)),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.kitchen,
                color: Colors.green[500],
              ),
              Text(
                'PREgP:',
                style: TextStyle(fontSize: 10),
              ),
              Text('25 min', style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    ));

final leftColumn = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      iconList,
      Ratings,
    ],
  ),
  padding: EdgeInsets.all(20),
);

class _MyAppState extends State<Design> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Center(
                child: Text("Flutter",
                    style: TextStyle(
                        fontFamily: "CrashLandingBB", fontSize: 20)),
              )),
          body: InkWell(
            onTap: () {
              print("Container pressed");
            },
            child: Container(
              child: leftColumn,
            ),
          )),);
  }
}