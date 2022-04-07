import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class logicHub extends GetxController {
  var apiKey = '563492ad6f91700001000001e583c6e4ba6941bca7aee678b078136a'.obs;
  var baseUrl = 'https://api.pexels.com/v1/'.obs;
  var currentWallpaper = 'from controller'.obs;
  List imges = [].obs;
  void getImages() async {
    try {
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = apiKey;

      var response = await dio
          .get('https://api.pexels.com/v1/search?query=nature&per_page=80');
      var res = response.data;
      List s = res['photos'];
      for (var i = 0; i <= s.length; i++) {
        imges.add(s[i]['src']['medium']);
        print(imges);
      }
    } catch (e) {
      print(e);
    }
  }
}
