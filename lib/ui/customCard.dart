import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String desc;
  final String title;
  double screenHeight;
  double screenWidth;

  CustomCard({this.desc, this.title});
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Text(
          '${desc ?? 'N/A'}',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.0165 + screenWidth * 0.04,
            letterSpacing: 1.6,
            fontFamily: 'PopB',
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.0106 + screenWidth * 0.022,
            fontFamily: 'PopM',
          ),
        ),
      ],
    );
    ;
  }
}
