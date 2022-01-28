import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textWidget extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  textWidget(this.text, this.color, this.fontSize, this.fontWeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
