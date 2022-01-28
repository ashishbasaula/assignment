import 'dart:async';

import 'package:assignment/screen/login.dart';
import 'package:assignment/screen/signUp.dart';
import 'package:assignment/widget/containerButton.dart';
import 'package:assignment/widget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class optionDash extends StatefulWidget {
  const optionDash({Key? key}) : super(key: key);

  @override
  _optionDashState createState() => _optionDashState();
}

class _optionDashState extends State<optionDash> {
  bool selected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        selected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                top: 140,
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/lunch-time.png"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),

          // this is for login register button
          const SizedBox(
            height: 170,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: textWidget(
                          "Login", Colors.black, 25, FontWeight.bold),
                    ),
                  ),
                ),
              ),
              // this is for the sign up
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: textWidget(
                          "Sign Up", Colors.black, 25, FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // this is for the finger prinbt
          const SizedBox(
            height: 20,
          ),
          textWidget(
              "New quick Login Touch Id", Colors.white, 20, FontWeight.bold),
          const SizedBox(
            height: 20,
          ),
          const Icon(
            Icons.fingerprint,
            color: Colors.white,
            size: 70,
          )
        ]),
      ),
    );
  }
}
