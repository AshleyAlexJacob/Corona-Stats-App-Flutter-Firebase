import 'package:flutter/material.dart';
import 'package:coronastats/ui/aap_Drawer.dart';
import 'package:coronastats/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
class AboutMe extends StatefulWidget {
  static String id='lastone';

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  _sendEmail()async{
//    final mailtoLink = Mailto(
//      to: ['alexjacob260.com'],
//    );
  final Uri link = Uri(
      scheme: 'mailto',
      path: 'alexjacob260@gmail.com',
  );
      await launch(link.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor4,
        elevation: 0,
      ),
      drawer: AppDrawer(),
      backgroundColor: kColor4,
      body: _body(),
    );
  }

  _body(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _image(),
        _info(),
      ],
    );
  }

  _image(){
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Center(
        child: CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage('images/me.jpg'),
        ),
      ),
    );
  }
_info(){
    return Column(
      children: <Widget>[
        Text('Ashley Alex Jacob',style: TextStyle(color: Colors.white,fontSize: 30,letterSpacing: 1.6,fontFamily:'Mukta',fontWeight: FontWeight.w700),),
        SizedBox(height: 2.0,width: 200.0,child: Container(color: Colors.white,),),
        SizedBox(height: 2.0,),
        Text('FLUTTER MOBILE APP DEVELOPER\nGRAPHICS DESIGNER',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,letterSpacing: 2,fontFamily:'Mukta',fontWeight: FontWeight.w500),),
        SizedBox(height: 20.0,),
        Text('Want to connect with me?',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 2,fontFamily:'Mukta',fontWeight: FontWeight.w500),),
        SizedBox(height: 2.0,),
        RaisedButton(
          shape: CircleBorder(),
          onPressed: _sendEmail,
          child: Icon(Icons.arrow_forward_ios,color: kColor4,size: 60,),
        ),
      ],
    );
}
}
