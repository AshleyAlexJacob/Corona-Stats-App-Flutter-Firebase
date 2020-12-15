import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/screens/welcomeScreen.dart';

class SplashScreen2 extends StatefulWidget {
  static String id = 'first2';

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    _waitAndNavigate();
    super.initState();
  }

  _waitAndNavigate() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor4,
      body: _body(),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            'COVID-19',
            style: kSplashScreenStyling,
          ),
        ),
//        SizedBox(height: 50,),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
