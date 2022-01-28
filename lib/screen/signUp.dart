import 'package:assignment/model/userDataModel.dart';
import 'package:assignment/screen/login.dart';
import 'package:assignment/widget/containerButton.dart';
import 'package:assignment/widget/textFieldWidget.dart';
import 'package:assignment/widget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheck = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();

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
                  duration: Duration(seconds: 2),
                  child: Image.asset(
                    "assets/wave diagream.png",
                    fit: BoxFit.fill,
                  )),
            ),
            // this is for the image container
            PlayAnimation<double>(
                tween:
                    Tween(begin: 0.0, end: MediaQuery.of(context).size.width),
                curve: Curves.easeInOutCirc,
                duration: Duration(seconds: 1),
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
                                textWidget("Create Account", Colors.black, 30,
                                    FontWeight.bold),
                                textField(userName, "Hari",
                                    FontAwesomeIcons.user, "User Name", false),
                                textField(email, "example@gmail.com",
                                    Icons.email, "Email Id*", false),
                                textField(password, "example@gmail.com",
                                    Icons.password, "Email Password*", true),
                                // this is check box
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.greenAccent,
                                      activeColor: Colors.red,
                                      value: isCheck,
                                      onChanged: (value) {
                                        setState(() {
                                          isCheck = value!;
                                        });
                                      },
                                    ),
                                    // this is text after check box
                                    textWidget(
                                        "I Read And Agree Terms And Condition",
                                        Colors.black38,
                                        18,
                                        FontWeight.bold),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // this is container buttonm
                                containerButton("Register Now ", () {
                                  if (UserData.isSave.isFalse &&
                                      email.text != "" &&
                                      userName.text != "" &&
                                      password.text != "") {
                                    UserData(userName.text, email.text,
                                            password.text)
                                        .saveUserInfo();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Fields cannot be empty");
                                  }
                                  email.text = "";
                                  password.text = "";
                                  userName.text = "";
                                }),

                                // this is for login using other
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: textWidget(
                                      "or Register Using Social Media",
                                      Colors.black,
                                      18,
                                      FontWeight.bold),
                                ),
                                // this is for the icon pallet

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                            textWidget("Already Have account ? ", Colors.black,
                                20, FontWeight.bold),
                            TextButton(
                                onPressed: () {
                                  // naviagte to registration page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                },
                                child: textWidget("Log In", Colors.orange, 20,
                                    FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
