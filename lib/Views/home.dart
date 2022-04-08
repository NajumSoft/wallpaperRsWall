import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rswall/Controllers/LogicHub.dart';
import 'package:rswall/Models/sampledata.dart';
import 'package:rswall/Views/landingPage.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final logicHubController = Get.put(logicHub());
  // final BannerAd myBanner = BannerAd(
  //   adUnitId: BannerAd.testAdUnitId,
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: BannerAdListener(),
  // );

  @override
  void initState() {
    logicHubController.getImages();
    // myBanner.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Center(
            child: Text(
          'Comming Soon',
          style: TextStyle(color: Colors.white),
        )),
      ),
      backgroundColor: Color.fromARGB(90, 53, 53, 53),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Zedge',
          style: TextStyle(
              fontSize: 25.0,
              color: Color.fromARGB(255, 255, 255, 255),
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                logicHubController.getImages();
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 80,
              //   width: 300,
              //   child: AdWidget(ad: myBanner),
              // ),
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
                    color: Color.fromARGB(255, 255, 255, 255)),
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
                    color: Color.fromARGB(255, 248, 248, 248)),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      crossAxisCount: 3,
                      childAspectRatio: .5),
                  itemCount: logicHubController.imges.length,
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
                                    logicHubController.imges[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
