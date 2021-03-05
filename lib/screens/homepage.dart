import 'package:b1/screens/edit_profile.dart';
import 'package:b1/screens/list.dart';
import 'package:b1/screens/notification.dart';
import 'package:b1/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:b1/screens/drawer.dart';

import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: InkWell(
                child: Icon(Icons.notifications, size: 26.0),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Notification1()));
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: InkWell(
                child: Icon(Icons.account_circle_outlined),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Carousel(
                  dotSize: 5.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.lightBlueAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  dotVerticalPadding: 5.0,
                  images: [
                    InkWell(
                        onTap: () {
                          print('Image 1 Clicked');
                        },
                        child: Image.asset('assets/images/Brahmin_1.jpg',
                            fit: BoxFit.cover)),
                    InkWell(
                        onTap: () {
                          print('Image 2 Clicked');
                        },
                        child: Image.asset('assets/images/Brahmin_2.jpg',
                            fit: BoxFit.cover)),
                    InkWell(
                        onTap: () {
                          print('Image 3 Clicked');
                        },
                        child: Image.asset('assets/images/Brahmin_3.jpg',
                            fit: BoxFit.cover)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange,
                      offset: Offset(2.5, 3.5),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Location",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          showSearch(context: context, delegate: DataSearch());
                        },
                      ),
                    ),
                    onTap: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 350,
                width: double.maxFinite,
                child: T(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
