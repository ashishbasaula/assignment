import 'package:assignment/model/onBoardingModel.dart';
import 'package:assignment/screen/dashBoard.dart';
import 'package:assignment/screen/login.dart';
import 'package:assignment/screen/signUp.dart';
import 'package:assignment/widget/pageCard.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class obbaording extends StatelessWidget {
  late List<pageData> pages = [
    pageData(
      subtitle: "Choose Your Favourit Flavour",
      title: "Choose your Flavour",
      textColor: Colors.white,
      imagePath: "assets/drink.png",
      bgColor: Color(0xFFFDBFDD),
    ),
    pageData(
      subtitle: "A Delecious Journey To treate Your Soul.",
      imagePath: "assets/celebration.png",
      title: "Healthy And Natural ",
      bgColor: Color(0xFFFFFFFF),
    ),
    pageData(
      subtitle: "Pick Your Juice at Your Door Step",
      title: "Juice At Your Door Step",
      bgColor: Color(0xFF0043D0),
      textColor: Colors.white,
      imagePath: "assets/motorbike.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: ConcentricPageView(
          onFinish: () async {
            SharedPreferences _pref = await SharedPreferences.getInstance();
            _pref.setBool("Isfirst", false);
            Fluttertoast.showToast(msg: "This was called");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          colors: const [
            Color(0xff1EB091),
            Color(0xffFEAE4F),
            Color(0xFFFEBE96),
          ],
          radius: 30,
          curve: Curves.ease,
          duration: const Duration(seconds: 1),
          itemBuilder: (index, value) {
            pageData page = pages[index % pages.length];

            return Container(
              child: Theme(
                data: ThemeData(
                  textTheme: TextTheme(
                    headline6: TextStyle(
                      color: page.textColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.0,
                      fontSize: 17,
                    ),
                    subtitle2: TextStyle(
                      color: page.textColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
                child: PageCard(page: page),
              ),
            );
          },
        ),
      ),
    );
  }
}
