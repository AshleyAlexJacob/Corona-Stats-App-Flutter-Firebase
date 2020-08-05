import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String text;
  final bool hideText;
  final Function onValue;
  CustomField({this.text,@required this.hideText,@required this.onValue});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onValue,
      obscureText: hideText,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(35),),
          borderSide: BorderSide.none,
        ),
        focusColor: Colors.white,
      ),
    );
  }
}
