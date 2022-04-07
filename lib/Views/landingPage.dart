import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rswall/Controllers/LogicHub.dart';
import 'package:rswall/Views/imgDetailView.dart';

class landingPage extends StatefulWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  final logicHubController = Get.put(logicHub());

  int _currentPage = 0;
  List<String> urls = [
    'https://cdn.wallpapersafari.com/3/69/NVz4kr.jpg',
    'https://r1.ilikewallpaper.net/iphone-wallpapers/download-84488/silhouette-of-palm-tree-during-golden-hour_200c.jpg',
    'https://icdn.digitaltrends.com/image/digitaltrends/crop-3-php-591x1280.jpg',
    'https://www.imagesjunction.com/images/img/mobile_hd_wallpapers.jpg',
    'https://cdn.wallpapersafari.com/21/0/m6bFal.jpg',
    'https://cdn.statusqueen.com/mobilewallpaper/thumbnail/mobile_wallpaper__1-471.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqI6m7G-MV_HoOe5fVp6hkaU12jYzVFluWgA&usqp=CAU',
    'https://i.pinimg.com/originals/c4/2c/d3/c42cd325eb9e88ff4acd0b6914b9a3f0.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGUzGPCvZR7jkJmXwB1mJ9-1k0a5JexnZBcvoS8Ru-85jMuPO6xcqyQiotks3AfjXzLfQ&usqp=CAU',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(microseconds: 500),
          child: Container(
            key: ValueKey<String>(urls[this._currentPage]),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(urls[_currentPage]),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: .80,
          child: PageView.builder(
              itemCount: urls.length,
              onPageChanged: (int page) {
                setState(() {
                  this._currentPage = page;
                });
              },
              itemBuilder: ((BuildContext context, int index) {
                return FractionallySizedBox(
                  widthFactor: 0.9,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(imgdetailView(context, urls[index]));
                    },
                    child: Hero(
                      tag: 'img',
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(178, 37, 37, 37),
                                offset: Offset.zero,
                                blurRadius: 10.0,
                              ),
                            ],
                            image: DecorationImage(
                                image: NetworkImage(urls[index]),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32))),
                      ),
                    ),
                  ),
                );
              })),
        )
      ],
    ));
  }
}
