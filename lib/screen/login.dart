import 'package:assignment/model/getUserdata.dart';
import 'package:assignment/screen/dashBoard.dart';
import 'package:assignment/screen/signUp.dart';
import 'package:assignment/widget/containerButton.dart';
import 'package:assignment/widget/textFieldWidget.dart';
import 'package:assignment/widget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late GetUserData getUserData;
  bool getData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData = GetUserData();
    getUserData.getPref();
    if (getUserData.isLoad == "yes") {
      setState(() {
        getData = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7FC),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: AnimatedContainer(
                  curve: Curves.bounceIn,
                  // color: const Color(0xFFC73800),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 250,
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    "assets/wave diagream.png",
                    fit: BoxFit.fill,
                  )),
            ),
            // this is for the image container

            PlayAnimation<double>(
              tween: Tween(begin: 0.0, end: MediaQuery.of(context).size.width),
              curve: Curves.easeInQuad,
              duration: Duration(seconds: 2),
              builder: (context, child, value) {
                return Container(
                  width: value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 140,
                          left: 30,
                        ),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/burger.png"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15, right: 15, bottom: 1),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.cyan,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              textWidget(
                                  "Hello", Colors.black, 50, FontWeight.bold),
                              textWidget("Sign Into Your Account", Colors.black,
                                  20, FontWeight.bold),
                              textField(email, "example@gmail.com", Icons.email,
                                  "Email Id*", false),
                              textField(password, "example@gmail.com",
                                  Icons.password, "Email Password*", true),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 30.0,
                                    top: 5.0,
                                    bottom: 10.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Forget Password ?",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.black38,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // this is container buttonm
                              containerButton("Login", () async {
                                if (email.text == "" && password.text == "") {
                                  Fluttertoast.showToast(
                                      msg: "Fields Cannot be empty");
                                } else {
                                  if (getUserData.email == email.text &&
                                      getUserData.password == password.text) {
                                    SharedPreferences _pref =
                                        await SharedPreferences.getInstance();
                                    _pref.setBool("isLog", true);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Dashboard()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Wrong email and passsword");
                                  }
                                }
                              }),

                              // this is for login using other
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: textWidget("or Login Using Social Media",
                                    Colors.black, 18, FontWeight.bold),
                              ),
                              // this is for the icon pallet

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.blue,
                                      size: 40,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // this is for the register option
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          textWidget("Don't Have account ", Colors.black, 20,
                              FontWeight.bold),
                          TextButton(
                              onPressed: () {
                                // naviagte to registration page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              child: textWidget("Register Now", Colors.orange,
                                  20, FontWeight.bold))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
