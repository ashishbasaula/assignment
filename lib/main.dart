import 'package:assignment/model/getOnBoardAndLogin.dart';
import 'package:assignment/screen/dashBoard.dart';
import 'package:assignment/screen/login.dart';
import 'package:assignment/screen/onbaording.dart';
import 'package:assignment/screen/optionScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: checkLogin(),
    debugShowCheckedModeBanner: false,
    title: "Flutter Assignment",
  ));
}

class checkLogin extends StatefulWidget {
  const checkLogin({Key? key}) : super(key: key);

  @override
  _checkLoginState createState() => _checkLoginState();
}

class _checkLoginState extends State<checkLogin> {
  late getOnboardData data;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getOnboardData();
    data.getInfo();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter Assignment",
            home: data.isfirst.value ? obbaording() : const checkInfoLogin(),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class checkInfoLogin extends StatefulWidget {
  const checkInfoLogin({Key? key}) : super(key: key);

  @override
  _checkInfoLoginState createState() => _checkInfoLoginState();
}

class _checkInfoLoginState extends State<checkInfoLogin> {
  late getOnboardData data;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getOnboardData();
    data.getInfo();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter Assignment",
            home: data.isLogin.value == true ? Dashboard() : const Login(),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
