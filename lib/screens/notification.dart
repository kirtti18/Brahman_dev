import 'package:flutter/material.dart';

class Notification1 extends StatefulWidget {
  @override
  _Notification1State createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Notification"),
      ),
      body: Container(
        child: Center(
          child: Text("No Notification"),
        ),
      ),
    );
  }
}
