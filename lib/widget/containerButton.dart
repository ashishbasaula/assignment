import 'package:assignment/widget/textWidget.dart';
import 'package:flutter/material.dart';

class containerButton extends StatelessWidget {
  String text;
  Function ontap;
  containerButton(this.text, this.ontap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xffFF7B17)),
        child: Center(
          child: textWidget(text, Colors.white, 20, FontWeight.bold),
        ),
      ),
    );
  }
}
