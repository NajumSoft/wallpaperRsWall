import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rswall/Controllers/LogicHub.dart';
import 'package:rswall/Models/sampledata.dart';
import 'package:rswall/Views/landingPage.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final logicHubController = Get.put(logicHub());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Wall Studio',
          style:
              TextStyle(fontSize: 25.0, color: Colors.grey, letterSpacing: 1.5),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 60.0,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: myData().colors.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         width: 50.0,
              //         margin: EdgeInsets.all(7),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(12)),
              //             color: myData().colors[index]),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Popular Catergories',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sampleData().categories.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 180.0,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      sampleData().categories[index]['img']),
                                  fit: BoxFit.cover)),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(landingPage());
                            print('object');
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 180.0,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(99, 0, 0, 0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 180.0,
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              sampleData().categories[index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  letterSpacing: 2.0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            )),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Trending Wallpaper',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2.0 / 3.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: sampleData().categories.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(landingPage());
                        print('helo');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 189, 189, 189),
                            image: DecorationImage(
                                image: NetworkImage(
                                    sampleData().categories[index]['img']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
