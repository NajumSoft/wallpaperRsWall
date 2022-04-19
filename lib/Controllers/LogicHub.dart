import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class logicHub extends GetxController {
  var apiKey = '563492ad6f91700001000001e583c6e4ba6941bca7aee678b078136a'.obs;
  var baseUrl = 'https://api.pexels.com/v1/'.obs;
  var selectedWallpaperIdIs = 2000.obs;
  var currentWallpaper = ''.obs;
  var pageNumber = 1.obs;
  List imges = [].obs;
  List wallpapers = [''].obs;

  // getWallpaper() async {
  //   print('getwallpaepr function call');
  //   try {
  //     Dio dio = new Dio();
  //     dio.options.headers["Authorization"] = apiKey;

  //     var response = await dio.get(
  //         'https://api.pexels.com/v1/photos/${selectedWallpaperIdIs.value}');
  //     var res = response.data;
  //     print(res);
  //     wallpapers = [res['src']['tiny']];
  //     print(wallpapers);
  //     this.pageNumber.value = this.pageNumber.value + 1;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void getMoreImages() async {
    try {
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = apiKey;

      var response = await dio.get(
          'https://api.pexels.com/v1/curated?per_page=80&page=' +
              pageNumber.value.toString());
      var res = response.data;

      imges.addAll(res['photos']);
      this.pageNumber.value = this.pageNumber.value + 1;
      print(imges);
    } catch (e) {
      print(e);
    }
  }

  void getImages() async {
    try {
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = apiKey;

      var response =
          await dio.get('https://api.pexels.com/v1/curated?per_page=80&page=1');
      var res = response.data;
      imges.addAll(res['photos']);
      this.pageNumber.value = this.pageNumber.value + 1;
    } catch (e) {
      print(e);
    }
  }
}
