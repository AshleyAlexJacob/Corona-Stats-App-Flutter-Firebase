import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/ui/aap_Drawer.dart';
import 'package:coronastats/services/online_data.dart';
import 'package:intl/intl.dart';
import 'package:coronastats/services/firebaseHelper.dart';
import 'package:coronastats/screens/signin.dart';
import 'package:coronastats/screens/welcomeScreen.dart';
import 'package:coronastats/services/firebaseHelper.dart';
class MainScreen extends StatefulWidget {
  final FirebaseHelper helper;
  MainScreen({this.helper});
  static String id = 'fifth';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CoronaStats coronaStats = CoronaStats();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  final formatter = new NumberFormat("#,###");
  var coronaData;
  void getData()async{
    coronaData=await coronaStats.fetchData(url);
    updateUi(coronaData);
  }

  var _infected;
  var _recovered;
  var _death;
  var _sick;
  var _tCases;
  var _tDeaths;

  void updateUi (dynamic coronaData)async{
  setState(() {
    if (coronaData==null){
      _infected=000;
      _recovered=000;
      _death=000;
      _sick=000;
      _tCases=000;
      _tDeaths=000;
    }
    else{
      _infected=formatter.format(coronaData['cases']) ;
      _recovered=formatter.format(coronaData['recovered']);
      _death=formatter.format(coronaData['deaths']);
      _sick=formatter.format(coronaData['active']);
      _tCases=formatter.format(coronaData['todayCases']);
      _tDeaths=formatter.format(coronaData['todayDeaths']);
    }

  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor4,
      appBar: AppBar(backgroundColor: kColor4,elevation: 0,actions: <Widget>[
        IconButton(icon: Icon(Icons.account_box,color: Colors.white,),
          onPressed: ()async{
            var usr = await widget.helper.logOut();
            if(usr==true)
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> WelcomeScreen(helper: widget.helper,)));
            print('User Log Out');
          },),
      ],),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _body(),
        ),
      ),
    );
  }

  _body(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _map(),
          _stats(),
        ],
      ),
    );
  }
  _map(){
    return Container(
      width:350,
      height: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/map.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  _stats(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$_infected'??'N/A',style: TextStyle(color: kColor1,fontSize: 45,letterSpacing: 1.8,fontFamily:'Mukta',fontWeight: FontWeight.w900),),
        Text('INFECTED',style: TextStyle(color: kColor1,fontSize: 30,fontFamily:'Mukta',fontWeight: FontWeight.w700),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('$_death'??'N/A',style: kNumStatsStyling,),
                  Text('DEAD',style: kHeadStatsStyling,),
                ],
              ),
           //   SizedBox(width: size,),
              Column(
                children: <Widget>[
                  Text('$_recovered'??'N/A',style: kNumStatsStyling,),
                  Text('RECOVERED',style: kHeadStatsStyling,),
                ],
              ),
             // SizedBox(width: size,),
              Column(
                children: <Widget>[
                  Text('$_sick'??'N/A',style: kNumStatsStyling,),
                  Text('*SICK',style:kHeadStatsStyling,),
                ],
              ),
              //SizedBox(width: size,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('$_tCases'??'N/A',style: kNumStatsStyling,),
                  Text('TODAY CASES',style: kHeadStatsStyling,),
                ],
              ),

              Column(
                children: <Widget>[
                  Text('$_tDeaths'??'N/A',style: kNumStatsStyling,),
                  Text('TODAY DEATHS',style: kHeadStatsStyling,),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Text('* == Currently',style:kHeadStatsStyling,),
      ],
    );
  }
}

