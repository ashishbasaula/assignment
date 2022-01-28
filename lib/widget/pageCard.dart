import 'package:assignment/model/onBoardingModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageCard extends StatelessWidget {
  final pageData page;

  const PageCard({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 120,
            ),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(page.imagePath!), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(height: 30),
          _buildText(context),
          const SizedBox(
            height: 10,
          ),
          _buildSubtitle(context),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      page.title!.toUpperCase(),
      style: GoogleFonts.comforter(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        letterSpacing: 2,
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      page.subtitle!.toUpperCase(),
      style: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 0.5,
      ),
    );
  }
}
