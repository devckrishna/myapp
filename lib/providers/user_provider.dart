import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  int _id = 0;

  int get id => _id;

  UserProvider() {
    setId();
  }

  Future<void> setId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _id = preferences.getInt("id") ?? 0;
    print(_id);
    notifyListeners();
  }

  Future<void> addToSP(int userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("id", userId);
    _id = userId;
    notifyListeners();
  }

  Future<void> removeFromSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    // print("hell----------");
    _id = 0;
    notifyListeners();
  }

  Future<void> addNameAndAge(String name, String gender, String age) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", name);
    preferences.setString("age", age);
    preferences.setString("gender", gender);
    notifyListeners();
  }
}
