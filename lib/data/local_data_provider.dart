
import 'package:shared_preferences/shared_preferences.dart';
import 'demo_data.dart';
import 'dart:convert';

class LocalDataProvider {
  Future<DemoData> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var homeDateJson = prefs.get('home');
    if (homeDateJson == null) {
      return null;
    }
    return DemoData.fromJson(json.decode(homeDateJson));
  }

  Future<bool> saveData(DemoData homeData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var homeDataJson = homeData.toJson();
    return prefs.setString('home', json.encode(homeDataJson));
  }
}