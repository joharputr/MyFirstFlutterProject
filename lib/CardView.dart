import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CardView()));
}

class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
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
              onPressed: () {},
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
      ),
    );
  }
}
