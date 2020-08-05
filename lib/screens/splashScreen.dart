import 'package:coronastats/screens/signin.dart';
import 'package:coronastats/services/firebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/screens/welcomeScreen.dart';
import 'package:coronastats/screens/main_Screen.dart';
import 'package:coronastats/ui/map.dart';
import 'package:coronastats/services/firebaseHelper.dart';
class SplashScreen extends StatefulWidget {
  static String id = 'first';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseHelper helper = FirebaseHelper();
  @override
  void initState() {
    _waitAndNavigate();
    _handlescreen();
    super.initState();
  }
Future<void>_handlescreen()async{
    if(await helper.loggedIn()){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>MainScreen(helper: helper,)));
    }
    else{
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context)=>WelcomeScreen(helper: helper,)));
    }
}
  _waitAndNavigate() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor4,
      body: _body(),
    );
  }

  _body(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text('COVID-19',style: kSplashScreenStyling,),
        ),
//        SizedBox(height: 50,),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(2),
            width: 609,
            height: 409,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/back.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
