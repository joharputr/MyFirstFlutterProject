import 'package:flutter/material.dart';
import 'package:flutter_app/api/model/get_model.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() => runApp(getActivity());

class getActivity extends StatefulWidget {
  @override
  _getDataState createState() => _getDataState();
}

class _getDataState extends State<getActivity> {
  Future<User> userfuture;

  @override
  void initState() {
    // here first we are checking network connection
    User.isConnected().then((internet) {
      if (internet) {
        // set state while we fetch data from API
      setState(() {
          // calling API to show the data
          // you can also do it with any button click.
          userfuture = User.connectToApi("2");
        });
      } else {
        /*Display dialog with no internet connection message*/
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TEST GET"),
        ),
        body: Container(
            child: FutureBuilder<User>(
                future: userfuture,

                builder: (context, snapshot) {

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      {
                        // here we are showing loading view in waiting state.
                        return loadingView();
                      }
                    case ConnectionState.active:
                      {
                        break;
                      }
                    case ConnectionState.done:
                      {
                        // in done state we will handle the snapshot data.
                        // if snapshot has data show list else set you message.
                        if (snapshot.hasData) {
                          // hasdata same as data!=null
                          if (snapshot.data != null) {
                            return Text((snapshot.data.name));
                          } else {
                            // display error message if your list or data is null.
                            return noDataView("No data found");
                          }
                        } else if (snapshot.hasError) {
                          // display your message if snapshot has error.
                          return noDataView("Something went wrong");
                        } else {
                          return noDataView("Something went wrong");
                        }
                        break;
                      }
                    case ConnectionState.none:
                      {}
                  }
                  return  loadingView();
                }),
          ),

      ),
    );
  }

  Widget loadingView() => Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      );

  Widget noDataView(String msg) => Center(
        child: Text(
          msg,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      );
}
