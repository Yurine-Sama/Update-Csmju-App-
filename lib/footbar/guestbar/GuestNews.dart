import 'dart:convert';
import 'dart:io';

import 'package:appcsmju/APImodel/apinew.dart';
import 'package:appcsmju/api/apinew_foot.dart';
import 'package:appcsmju/model/newsmodel/customListTile.dart';
import 'package:appcsmju/page/notifications/notifications.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestNews extends StatefulWidget {
  const GuestNews({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<GuestNews> {
  @override
  void initState() {
    super.initState();
    this.fetchNews();
  }

List news_detail = [];

  fetchNews() async {
    print("fetching...");
    var _data = await ApiService.getArticle();
    print(_data.data);
    if (_data != null) {
      setState(() {
        news_detail = _data.data;
      });
    } else {
      setState(() {
        news_detail = [];
      });
    }
  }
  ApiService client = ApiService();
  var ID;
  var image;

//////////////////////////////////////////////////////////////////////>>>>>>>>get user
  //ProfileP? profileP;

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: Text(
          "ข่าวสาร",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
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
      body: FutureBuilder(
        ///////////////////////////////////////////////////////////>>>>>>>>>>แสดงหน้าข่าว
        future: ApiService.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
 
            return SingleChildScrollView(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                shrinkWrap: true,
                reverse: true,
                itemCount: news_detail.length,
                itemBuilder: (context, index) =>
                    customListTile(news_detail[index], context),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
