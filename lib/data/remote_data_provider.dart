
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';
import 'demo_data.dart';
import 'dart:convert';

class RemoteDataProvider {
  Future<DemoData> loadData() async {

//    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
  var homeData = DemoData(
    [new ItemData('标题一', '我的好帮手',  imgList[0], '')],
    [new ItemData('标题二', '我的好帮手',  imgList[1], ''),
      new ItemData('标题三', '我的好帮手',  imgList[2], ''),
      new ItemData('标题三', '我的好帮手',  imgList[2], '')],
  );
    var homeDateJson = homeData.toJson();
    developer.log('Rsponse', name: '', error: jsonEncode(homeDateJson));
    return Future.delayed(const Duration(milliseconds: 3000))
        .then((value) => DemoData.fromJson(homeDateJson));
  }

}