import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/model/get_model.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() => runApp(getListActivity());

class getListActivity extends StatefulWidget {
  @override
  _getDataState createState() => _getDataState();
}

class _getDataState extends State<getListActivity> {
  Future<List<User>> getListUsers;

  @override
  void initState() {
    // here first we are checking network connection
    User.isConnected().then((internet) {
      if (internet) {
        // set state while we fetch data from API
        setState(() {
          // calling API to show the data
          // you can also do it with any button click.
          getListUsers = User.getUsersList("2");
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
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder<List<User>>(
              future: getListUsers,
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
                      if (snapshot.data != null) {
                        if (snapshot.data.length > 0) {
                          // here inflate data list
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return generateColum(
                                    snapshot.data[index]);
                              });
                        }else {
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
                return loadingView();
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

  Widget generateColum(User item) => Card(
    child: ListTile(
      leading: Image.network(item.img),
      title: Text(
        item.name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle:
      Text(item.id, style: TextStyle(fontWeight: FontWeight.w600)),
    ),
  );
}
