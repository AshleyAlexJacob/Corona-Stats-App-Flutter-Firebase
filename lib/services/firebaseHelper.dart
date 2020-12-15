import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final FirebaseAuth _auth;
  FirebaseHelper(this._auth);

  Stream<User>get authStateChanges => _auth.idTokenChanges();

  Future<String> signUp(String email,String password) async{
    try{
      print('Email: $email & Password: $password');
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "signed up";
    }
    catch(e){
      print('Caught Exception: $e');
      return e.message;
    }
  }
  Future<String> signIn(String email,String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "signed in";
    }
    catch (e){
      print('Exception Caught: $e');
      return e.message;
    }
  }

  Future <bool> logOut()async{

    try{
      await _auth.signOut();
      return true;
    }
    catch(e){
      print('Log Out Failed: $e');
      return false;
    }
  }
}