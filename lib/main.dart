import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coronastats/services/firebaseHelper.dart';
import 'screens/splashScreen.dart';
import 'package:coronastats/screens/splash2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseHelper>(
          create: (_) => FirebaseHelper(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseHelper>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'PopM',
        ),
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return SplashScreen();
    }
    return SplashScreen2();
  }
}
