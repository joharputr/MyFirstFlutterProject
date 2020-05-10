import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class UserJsonObject {

  String id, name,title;
  var img;

  UserJsonObject({this.title});

  factory UserJsonObject.fromJson(Map<String, dynamic> object) {
    return UserJsonObject(
      title: object['title'].toString(),
    );
  }

  static Future<UserJsonObject> connectToApi(String id) async {
    String apiURL = "https://reqres.in/api/users/" + id;
    var response = await http.get(apiURL);
    var jsonObject = json.decode(response.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return UserJsonObject.fromJson(userData);
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }


  static Future<List<UserJsonObject>> tesUserArray() async{
    String apiURL = "https://jsonplaceholder.typicode.com/albums";
    var response = await http.get(apiURL);
    var jsonObject = json.decode(response.body);
    List<dynamic> listarray = jsonObject;

    List<UserJsonObject> users = [];
    for (int i = 0; i < listarray.length; i++) {
      users.add(UserJsonObject.fromJson(listarray[i]));
    }
    return users;
  }
}
