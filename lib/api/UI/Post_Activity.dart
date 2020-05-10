import 'package:flutter/material.dart';
import 'package:flutter_app/api/model/post_result_model.dart';

void main() => runApp(Api());

class Api extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Api> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "API TEST",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: Container(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text((postResult != null)
                        ? postResult.created + " | " + postResult.name
                        : "Tidak Ada Data"),
                  ),
                  RaisedButton(
                    child: Text("tekan"),
                    onPressed: () {
                      PostResult.connectToAPi("john", "dokter").then((onValue) {
                        postResult = onValue;
                        setState(() {});
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
