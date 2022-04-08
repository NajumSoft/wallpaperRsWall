import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:rswall/Controllers/LogicHub.dart';
import 'package:get/get.dart';

class bottomSheet extends StatefulWidget {
  const bottomSheet({Key? key}) : super(key: key);

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  final logicHubController = Get.find<logicHub>();

  dynamic _wallpaperFile = 'Unknown';

  Future<void> setWallpaperHomeScreen() async {
    dynamic result;
    Navigator.pop(context);
    var file = await DefaultCacheManager()
        .getSingleFile(logicHubController.currentWallpaper.value);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);
      Get.snackbar('Wallpaper Set', 'Please see your wallpaper');
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    if (!mounted) return;

    setState(() {
      _wallpaperFile = result;
    });
  }

  Future<void> setWallpaperLockScreen() async {
    dynamic result;
    Navigator.pop(context);
    var file = await DefaultCacheManager()
        .getSingleFile(logicHubController.currentWallpaper.value);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.LOCK_SCREEN);
      Get.snackbar('Wallpaper Set', 'Please see your wallpaper');
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    if (!mounted) return;

    setState(() {
      _wallpaperFile = result;
    });
  }

  Future<void> setWallpaperBoth() async {
    dynamic result;
    Navigator.pop(context);
    var file = await DefaultCacheManager()
        .getSingleFile(logicHubController.currentWallpaper.value);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.BOTH_SCREEN);
      Get.snackbar('Wallpaper BOTH_SCREEN', 'Please see your wallpaper');
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    if (!mounted) return;

    setState(() {
      _wallpaperFile = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(151, 0, 0, 0),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Set wallpaper',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setWallpaperHomeScreen();
                print(logicHubController.currentWallpaper.value);
              },
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home Screen',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setWallpaperLockScreen();
              },
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                title: Text('Lock Screen',
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            InkWell(
              onTap: () {
                setWallpaperBoth();
              },
              child: ListTile(
                leading: Icon(
                  Icons.screen_lock_landscape,
                  color: Colors.white,
                ),
                title: Text('Home Screen and Lock Screen',
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
