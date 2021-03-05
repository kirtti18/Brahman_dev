import 'package:flutter/material.dart';

import 'homepage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String groupValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      "Create your account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(2.5, 3.5),
                                  blurRadius: 15,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(2.5, 3.5),
                                  blurRadius: 15,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Username",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(2.5, 3.5),
                                  blurRadius: 15,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(2.5, 3.5),
                                  blurRadius: 15,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(2.5, 3.5),
                                  blurRadius: 15,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(2.5, 3.5),
                                  blurRadius: 15,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: Text("Sign up"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orangeAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                    ),
                    // textColor: Colors.white,
                    // color: Colors.blue,
                    // padding: EdgeInsets.symmetric(
                    //   vertical: 10,
                    //   horizontal: 40,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
