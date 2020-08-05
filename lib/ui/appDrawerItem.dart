import 'package:flutter/material.dart';
class AppDrawerItem extends StatefulWidget {
  final IconData mark;
  final String text;
  final String route;
  AppDrawerItem({@required this.text,@required this.mark,this.route});

  @override
  _AppDrawerItemState createState() => _AppDrawerItemState();
}

class _AppDrawerItemState extends State<AppDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.mark,color: Colors.white,),
      title: Text(widget.text.toUpperCase(),style: TextStyle(color: Colors.white),),
      onTap: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, widget.route);
      },
    );
  }
}
