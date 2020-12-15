import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final IconData mark;
  final String text;
  final Widget route;
  AppDrawerItem({this.text, this.mark, this.route});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        mark,
        color: Colors.white,
      ),
      title: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.white, fontFamily: 'PopM', fontSize: 15),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => route));
      },
    );
  }
}
