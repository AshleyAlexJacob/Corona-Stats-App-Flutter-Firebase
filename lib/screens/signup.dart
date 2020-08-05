import 'package:flutter/material.dart';
import 'package:coronastats/ui/custom_field.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/screens/signin.dart';
import 'package:coronastats/services/firebaseHelper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:coronastats/screens/main_Screen.dart';
class SignUp extends StatefulWidget {
  static String id = 'third';
  FirebaseHelper helper;
  SignUp({this.helper});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;
  String pass;
  bool checkedValue=false;
  bool showSpinner=false;

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
          Text('Register',style: TextStyle(color: kColor1,fontSize: 35,fontFamily: 'Mukta',fontWeight: FontWeight.w600),),
          CustomField(text: 'Enter your Email Address',hideText: false,
            onValue: (val){
            email=val;
            },),
          SizedBox(height:10.0 ,),
          CustomField(text: 'Password',hideText: true,
            onValue: (val){
            pass=val;
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

                    title: Text('I agree with the terms and conditions and privacy policy',style: TextStyle(color: Colors.white,fontSize: 14.3),),
                    checkColor: kColor4,
                    activeColor: Colors.white,

                    value: checkedValue,
                    onChanged: (value){
                      checkToggle(checkedValue);
                    },
                    controlAffinity: ListTileControlAffinity.leading,

                  ),
                ),
              )
            ],
          ),
          SizedBox(height:10.0 ,),
          GestureDetector(
            onTap: ()async{
              setState(() {
                showSpinner=true;
              });
              var user= await widget.helper.signUp(email, pass);
              if(user!=null){
                print(user.email);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MainScreen(helper: widget.helper,)));
              }
              else
                print('User Registration Failed');
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
              child: Center(child: Text('Sign Up',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18),)),
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
        Text('Already have an account?',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Mukta'),),
        SizedBox(width: 5,),
        GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> SignIn(helper: widget.helper,)));
          },
          child: Text('Sign In',style: TextStyle(color: kColor1,fontSize: 18,fontFamily: 'Mukta',fontWeight: FontWeight.w600),),)
      ],
    );
  }
}
