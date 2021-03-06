import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class User {

  String id, name,title;
  var img;

  User({this.id, this.name,this.img});

  factory User.fromJson(Map<String, dynamic> object) {
    return User(
        id: object['id'].toString(),
        img : object['avatar'],
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<User> connectToApi(String id) async {
    String apiURL = "https://reqres.in/api/users/" + id;
    var response = await http.get(apiURL);
    var jsonObject = json.decode(response.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return User.fromJson(userData);
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

  static Future<List<User>> getUsersList(String id) async {
    String apiURL = "https://reqres.in/api/users?page=" + id;
    var response = await http.get(apiURL);
    var jsonObject = json.decode(response.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(User.fromJson(listUser[i]));
    }
    return users;
  }

}
