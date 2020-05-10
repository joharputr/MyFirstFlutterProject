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
  int _currentIndex = 0;
  static final container = Container(
    child: InkWell(
      onTap: () {
        print("Container pressed");
      },
      child: Container(
        child: leftColumn,
      ),
    ),
  );

  static final cardview = Container(
    child: ListView(
      children: <Widget>[
        Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: Icon(Icons.directions_walk),
              ),
              Text(
                "MAMA",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        )
      ],
    ),
  );

  var tabs = [
    Center(child: Text("home")),
    Center(child: Text("alarm")),
    cardview,
    container
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter",
                style: TextStyle(fontFamily: "CrashLandingBB", fontSize: 20)),
          ),
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarms), title: Text("alarm")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), title: Text("stars")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("account"))
            ],
            onTap: _onItemTapped,
          )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      this._currentIndex = index;
    });
  }
}
