import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/screens/signin.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kColor4,
      body: _body(context) ,
    );
  }

  _body(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _logoMark(),
        _textArea(),
        _buttonArea(context),
      ],
    );
  }

  _logoMark(){
    return Center(
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(20),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/virus.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _textArea(){
    return Column(
      children: <Widget>[
        Text('CORONA VIRUS',style: TextStyle(color: kColor1,fontSize: 40,fontFamily: 'Mukta',fontWeight: FontWeight.w800,letterSpacing: 2.5,),),
        Text('2019-nCOV',style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Mukta',fontWeight: FontWeight.w100,),),
        Text('What you need to know?',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Mukta',),),
        SizedBox(height: 20,),
      ],
    );
  }

  _buttonArea(BuildContext context){
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: kColor1,
      constraints: BoxConstraints.tightFor(
        height: 70,
        width: 70,
      ) ,
      child: Center(child: Icon(Icons.arrow_forward_ios,color: kColor4,size: 60,)),
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
      },
    );
  }
  }


