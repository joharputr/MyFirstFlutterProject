import 'package:flutter/material.dart';

void main() => runApp(MyApp());
int number = 0;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Coba Count"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              number.toString(),
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
              child: Text("tekan bos"),
              onPressed: tambah,
            )
          ],
        ),
      ),
    ));
  }

  void tambah() {
    setState(() {
      number++;
    });
  }
}
