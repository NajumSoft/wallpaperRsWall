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
  final logicHubController = Get.find<logicHub>();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(microseconds: 500),
          child: Container(
            // key: ValueKey<String>(logicHubController.imges[logicHubController.]),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(logicHubController.imges[
                            logicHubController.selectedWallpaperIdIs.value]
                        ['src']['tiny']),
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
              itemCount: logicHubController.imges.length,
              onPageChanged: (int page) {
                setState(() {
                  this._currentPage = page;
                  this.logicHubController.selectedWallpaperIdIs.value = page;
                });
              },
              itemBuilder: ((BuildContext context, int index) {
                return FractionallySizedBox(
                  widthFactor: 0.9,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(imgdetailView(
                          context,
                          logicHubController.imges[logicHubController
                              .selectedWallpaperIdIs
                              .value]['src']['original']));
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
                                image: NetworkImage(logicHubController.imges[
                                    logicHubController.selectedWallpaperIdIs
                                        .value]['src']['large2x']),
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
