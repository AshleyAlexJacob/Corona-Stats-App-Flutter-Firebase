import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/ui/aap_Drawer.dart';
class InProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor4,
        elevation: 0,
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }
  _body(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 262,
          width: 368,
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/in.png'),
            ),
          ),
        ),
        Text('To Be Added Soon',textAlign: TextAlign.center,style: TextStyle(color: kColor4,fontWeight: FontWeight.w900,fontSize:30.0,fontFamily:'Mukta',)),
      ],
    );
  }
}
