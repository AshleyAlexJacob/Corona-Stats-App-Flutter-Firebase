import 'package:flutter/material.dart';
import 'screens/splashScreen.dart';
import 'screens/signin.dart';
import 'screens/signup.dart';
import 'package:coronastats/screens/welcomeScreen.dart';
import 'screens/main_Screen.dart';
import 'package:coronastats/ui/map.dart';
import 'package:coronastats/screens/aboutMe.dart';
import 'screens/inProgress.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context)=> SplashScreen(),
        SignIn.id: (context)=> SignIn(),
        SignUp.id:(context)=>SignUp(),
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        MainScreen.id:(context)=>MainScreen(),
        AppMap.id:(context)=>AppMap(),
        AboutMe.id:(context)=>AboutMe(),
        InProgress.id:(context)=>InProgress(),
      },
    );
  }
}
