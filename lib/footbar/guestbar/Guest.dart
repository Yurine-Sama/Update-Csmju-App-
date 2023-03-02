import 'dart:convert';
import 'dart:io';
import 'package:appcsmju/page/Profile/Profile.dart';
import 'package:appcsmju/page/notifications/notifications.dart';
import 'package:appcsmju/widget/categories_widget.dart';
import 'package:http/http.dart' as http;
import 'package:appcsmju/APImodel/apinew.dart';
import 'package:appcsmju/api/API_activity.dart';
import 'package:appcsmju/APImodel/carousel.dart';
import 'package:appcsmju/api/newApi.dart';
import 'package:appcsmju/APImodel/Activity.dart';
import 'package:appcsmju/model/carouselmodel/Activitycustombelow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  _HomePageCarouselState createState() => _HomePageCarouselState();
}

//animals.reversed.toList();
class _HomePageCarouselState extends State<GuestPage> {
  late List<Activity> _activity;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getActivity();
  }

  var ID;
  var image;
  var studentcode;
//////////////////////////////////////////////////////////////////////>>>>>>>>get user
  //ProfileP? profileP;

  Future<void> getActivity() async {
    _activity = await ActivityApiService.getsActivity();
    setState(() {
      _isLoading = false;
    });
  }

  ////////////////////////////////////////////////////////////////////////////////
  APi pro = APi.instance;
  final List<String> imgList = [];
  List<Apinews> news = [];
  Future<Apinews>? futureAlbum;
  /* late final Apinew article;
   _HomePageCarouselState({required this.article}); */

  void getiii() async {
    var a = await pro.GetNews(context);
    //int i = 0;
    // for(i=0;i<pro.li.length;++i){
    //   imgList[i]=pro.li[i].newsPicture;
    // }
    a.forEach((value) {
      Apinew order = new Apinew.fromJson(value);
      imgList.add(order.newsPicture);
    });
    setState(() {
      news = pro.li;
      //futureAlbum = pro.GetNews(context);
    });
    //print(a);
    // print(" image  of newssss isss ${imgList[0]}");
  }

  @override
  Widget build(BuildContext context) {
    getiii();

    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                      border: Border.all(width: 2.5, color: Color(0xff24a878)),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: new NetworkImage(image == null
                              ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                              : image)))),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Notifications();
              }));
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.blueGrey[800],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(children: <Widget>[
          ///////////////////////////////////////////////////////>>>>>>>>หัวข้อข่าวประชาสัมพันธ์
          SizedBox(
            child: Text(
              "ข่าวประชาสัมพันธ์",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          ///////////////////////////////////////////////////////>>>>>>>>ไสลด์ข่าวประชาสัมพันธ์
          SizedBox(
            height: 10,
          ),
          Container(
            /* padding: const EdgeInsets.fromLTRB(7, 10, 7, 10), */
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000)),
                  items: imgList
                      .map((item) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SafeArea(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 3, color: Color(0xff24a878)),
                                ),
                                child: Center(
                                    child: Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  width: 1000,
                                )),
                              ),
                            ),
                          ))
                      .toList(),
                )),
          ),
          ///////////////////////////////////////////////////////>>>>>>>>หัวข้อโครงการล่าสุด
          SizedBox(
            height: 10,
          ),

          Visibility(
            visible: false,
            child: CategoriesWidget(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'โครงการล่าสุด',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          ///////////////////////////////////////////////////////>>>>>>>>รายการโครงการ
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: ActivityApiService.getsActivity(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Activity>> snapshot) {
                    if (snapshot.hasData) {
                      List<Activity>? data = snapshot.data;
                      return Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          itemCount: data!.length < 5 ? data.length : 5,
                          itemBuilder: (context, index) =>
                              customActivityBelow(data[index], context),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ))
        ]),
      ),
    );
  }
}
