import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:b1/controllers/auth.dart';
import 'package:b1/models/brahmin.dart';

class BrahmanSignup extends StatefulWidget {
  final Brahman bramhin;
  const BrahmanSignup({
    Key key,
    this.bramhin,
  }) : super(key: key);
  @override
  _BrahmanSignupState createState() => _BrahmanSignupState();
}

class _BrahmanSignupState extends State<BrahmanSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              child: Container(
                height: 700,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 30,
              child: "Welcome To Brahman Dev".text.bold.size(25).make(),
            ),
            Positioned(
              top: 130,
              left: 30,
              child: "Please Fill Details".text.gray600.bold.size(15).make(),
            ),
            Positioned(
              top: 180,
              left: 30,
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Name",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 30,
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Phone/Mobile",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 320,
              left: 30,
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintMaxLines: 3,
                      prefixIcon: Icon(Icons.location_on_outlined),
                      suffixIcon: Icon(Icons.gps_fixed_rounded),
                      hintText: "Enter your Address",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.streetAddress,
                    maxLength: 255,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 500,
              left: 50,
              child: InkWell(
                child: Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "Submit".text.bold.black.size(20).make(),
                      ],
                    ),
                  ),
                  height: 50,
                  width: 250,
                  color: Colors.grey[300],
                ),
                onTap: () async {
                  await AuthController().createNewBramhin(
                      bramhin: Brahman(
                    brahmanId: widget.bramhin.brahmanId,
                    name: "",
                    phone: "",
                    address: "",
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
