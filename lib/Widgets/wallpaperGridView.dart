import 'package:flutter/cupertino.dart';
import 'package:rswall/Models/sampledata.dart';

Widget wallpaperGridView() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1,
          physics: ScrollPhysics(),
          crossAxisSpacing: 10,
          // to disable GridView's scrolling
          shrinkWrap: true, // You won't see infinite size error
          children: List.generate(sampleData().categories.length, (index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(sampleData().categories[index]['img']))),
            );
          })),
    ),
  );
}
