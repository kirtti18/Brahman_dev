import 'package:b1/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:velocity_x/velocity_x.dart';

import 'brahman_Signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
        child: Stack(
          children: [
            Positioned(
              top: 80,
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
              top: 110,
              left: 100,
              child: Container(
                height: 200,
                width: 200,
                child: Image(
                  image: AssetImage(
                    'assets/images/b1.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 50,
              child: "Let's get something".text.bold.size(25).make(),
            ),
            Positioned(
              top: 370,
              left: 50,
              child: "Good to see you back".text.gray600.size(15).make(),
            ),
            Positioned(
              top: 450,
              left: 55,
              child: InkWell(
                child: Container(
                  child: Center(
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/google.png'),
                        ),
                        "Sign in with Google".text.bold.black.size(20).make(),
                      ],
                    ),
                  ),
                  height: 50,
                  width: 250,
                  color: Colors.grey[300],
                ),
                onTap: () async {
                  await AuthController().signIn(isBramhin: null);
                },
              ),
            ),
            Positioned(
              top: 520,
              left: 40,
              child: "____________________________________________"
                  .text
                  .gray500
                  .make(),
            ),
            Positioned(
              top: 580,
              left: 45,
              child:
                  "Want to Signup as Brahman?".text.bold.black.size(20).make(),
            ),
            Positioned(
              top: 630,
              left: 100,
              child: ElevatedButton(
                child: Text("Sign up"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BrahmanSignup()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
