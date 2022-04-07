import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rswall/Controllers/LogicHub.dart';
import 'package:rswall/Views/bottomSheet.dart';

Widget imgdetailView(BuildContext context, img) {
  final logicHubController = Get.find<logicHub>();
  return Scaffold(
    body: Stack(
      children: [
        Container(
          child: Hero(
            tag: 'img',
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover)),
            ),
          ),
        ),
        Positioned(
          bottom: 50.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                logicHubController.currentWallpaper.value = img;
                Get.bottomSheet(bottomSheet());
              },
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(143, 0, 0, 0)),
                child: Text(
                  'Set Wallpaper',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
