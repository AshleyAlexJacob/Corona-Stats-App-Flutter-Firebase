import 'package:coronastats/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronastats/ui/custom_field.dart';
import 'package:coronastats/screens/signup.dart';
import 'package:coronastats/screens/main_Screen.dart';
import 'package:coronastats/services/firebaseHelper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignIn extends StatefulWidget {
  final FirebaseHelper helper;
  SignIn({this.helper});
  static String id = 'second';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email;
  String pass;
  bool showSpinner=false;
  bool checkedValue=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void checkToggle(bool cv){
    if(cv==false)
      {
        setState(() {
          checkedValue=true;
        });
      }
    else if(cv==true){
      setState(() {
        checkedValue=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor4,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: _body(),
        ),
      ),
    );
  }
  _body(){
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _logo(),
        _textForm(),
        _otherMethods(),

        ],
      ),
    );
  }

  _logo(){
    return Center(
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(20),
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/virus.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  _textForm(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Text('Welcome!',style: TextStyle(color: kColor1,fontSize: 35,fontFamily: 'Mukta',fontWeight: FontWeight.w600),),
          CustomField(text: 'Enter your Email Address',hideText: false,
            onValue: (ea){
            email=ea;
            },),
          SizedBox(height:10.0 ,),
          CustomField(text: 'Password',hideText: true,
          onValue: (password){
            pass=password;
          },),
          SizedBox(height:10.0 ,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.white,
                  ),

                  child: CheckboxListTile(

                    title: Text('Remember',style: TextStyle(color: Colors.white,fontSize: 14.3),),
                    checkColor: kColor4,
                    activeColor: Colors.white,

                    value: checkedValue,
                    onChanged: (value){
                     checkToggle(checkedValue);
                    },
                    controlAffinity: ListTileControlAffinity.leading,

                  ),
                ),
              ),
              Flexible(child: Text('Forgot your password?',style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,
              fontSize: 14.3),))
            ],
          ),
          SizedBox(height:10.0 ,),
          GestureDetector(
            onTap: ()async{
              setState(() {
                showSpinner=true;
              });
              var userIn=await widget.helper.signIn(email, pass);
              if(userIn!=null){
                print('User In');
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MainScreen(helper: widget.helper,)));
              }
              else
                print('User Login Failed');
              setState(() {
                showSpinner=false;
              });
            },
            child: Container(
              height: 40.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: kColor1,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(child: Text('Sign In',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18),)),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
  _otherMethods(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Do not have an account?',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Mukta'),),
        SizedBox(width: 5,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SignUp(helper: widget.helper)));
          },
          child: Text('Sign Up',style: TextStyle(color: kColor1,fontSize: 18,fontFamily: 'Mukta',fontWeight: FontWeight.w600),))
      ],
    );
  }
}
