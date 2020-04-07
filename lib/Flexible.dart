import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FlexibleApp(),
  ));
}

final testFlexible = Container(
  height: 150,
  child: Column(
    children: <Widget>[
      Flexible(
          flex: 1,
          child: Container(
            color: Colors.yellow,
          )),
      Flexible(
          flex: 1,
          child: Container(
            color: Colors.red,
          )),
      Flexible(
        flex: 1,
        child: Container(
          color: Colors.green,
        ),
      )
    ],
  ),
);

class FlexibleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GaTauApa();
  }
}

class GaTauApa extends State<FlexibleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Flexible Layout"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            testFlexible,
            testFlexible
          ],
        )
    );
  }
}
