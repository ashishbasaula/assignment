import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textField extends StatelessWidget {
  TextEditingController controller;
  String labeltext;
  IconData icons;
  String hintText;
  bool isObsecure;
  textField(this.controller, this.hintText, this.icons, this.labeltext,
      this.isObsecure,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
      child: TextField(
        style: GoogleFonts.aBeeZee(
          color: Colors.black,
          fontSize: 20,
        ),
        obscureText: isObsecure,
        controller: controller,
        //  autofocus: true,
        decoration: InputDecoration(
          labelText: labeltext,

          suffixIcon: Icon(
            icons,
            color: Colors.orange,
          ),
          hintText: hintText,
          // ignore: unnecessary_const
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.cyan,
            width: 1.45,
          )),
        ),
      ),
    );
  }
}
