import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
class FirebaseHelper {
  final _auth=FirebaseAuth.instance;
  Future<bool> loggedIn() async {
    FirebaseUser firebaseUser = await getLoggedFirebaseUser();
    if (firebaseUser != null) {
      IdTokenResult tokenResult = await firebaseUser.getIdToken(refresh: true);
      return tokenResult.token != null;
    } else {
      return false;
    }
  }
  Future<FirebaseUser> getLoggedFirebaseUser() {
    return _auth.currentUser();
  }
  Future<FirebaseUser> signUp(String email,String password) async{
    try{
      print('Email: $email & Password: $password');
      final authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(authResult!=null){
        return authResult.user;
      }
      else
        return authResult.user;
    }
    catch(e){
      print('Caught Exception: $e');
      return null;
    }
  }
  Future<FirebaseUser> signIn(String email,String password)async{
    try{
      final signResult= await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(signResult!=null){
        return signResult.user;
      }
      else
        return signResult.user;
    }
    catch (e){
      print('Exception Caught: $e');
      return null;
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