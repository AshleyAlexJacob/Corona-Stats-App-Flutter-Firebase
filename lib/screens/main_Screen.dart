import 'package:coronastats/ui/customCard.dart';
import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/ui/aap_Drawer.dart';
import 'package:coronastats/services/online_data.dart';
import 'package:intl/intl.dart';
import 'package:coronastats/services/firebaseHelper.dart';
import 'package:provider/provider.dart';
import 'package:coronastats/screens/splash2.dart';

class MainScreen extends StatefulWidget {
  final FirebaseHelper helper;
  MainScreen({this.helper});
  static String id = 'fifth';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double screenHeight;
  double screenWidth;
  bool gotData = false;
  CoronaStats coronaStats = CoronaStats();
  @override
  void initState() {
    super.initState();
    getData();
  }

  final formatter = new NumberFormat("#,###");
  var coronaData;
  void getData() async {
    coronaData = await coronaStats.fetchData(url);
    updateUi(coronaData);
  }

  var _infected;
  var _recovered;
  var _death;
  var _sick;
  var _tCases;
  var _tDeaths;

  void updateUi(dynamic coronaData) async {
    setState(() {
      if (coronaData == null) {
        _infected = 000;
        _recovered = 000;
        _death = 000;
        _sick = 000;
        _tCases = 000;
        _tDeaths = 000;
      } else {
        gotData = true;
        _infected = formatter.format(coronaData['cases']);
        _recovered = formatter.format(coronaData['recovered']);
        _death = formatter.format(coronaData['deaths']);
        _sick = formatter.format(coronaData['active']);
        _tCases = formatter.format(coronaData['todayCases']);
        _tDeaths = formatter.format(coronaData['todayDeaths']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print("Height: $screenHeight");
    print("Width: $screenWidth");

    return Scaffold(
      backgroundColor: kColor4,
      appBar: AppBar(
        backgroundColor: kColor4,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_box,
              color: Colors.white,
            ),
            onPressed: () async {
              context.read<FirebaseHelper>().logOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SplashScreen2()));
              print('User Log Out');
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: gotData
              ? _body()
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: kColor4,
                  ),
                ),
        ),
      ),
    );
  }

  _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _map(),
          _stats(),
        ],
      ),
    );
  }

  _map() {
    return Container(
      width: screenWidth * 0.97,
      height: screenHeight * 0.22,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/map.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _hor1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight * 0.116,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomCard(
            desc: _death,
            title: "Dead",
          ),
          SizedBox(width: screenWidth * 0.083),
          CustomCard(
            desc: _recovered,
            title: "Recovered",
          ),
        ],
      ),
    );
  }

  _hor2() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight * 0.116,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomCard(
            desc: _sick,
            title: "* Sick",
          ),
          SizedBox(width: screenWidth * 0.083),
          CustomCard(
            desc: _tDeaths,
            title: "* Todays Death",
          ),
        ],
      ),
    );
  }

  _stats() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: screenHeight * 0.0518,
        ),
        Text(
          '${_infected ?? 'Fetching Data'}',
          style: TextStyle(
            color: kColor1,
            fontSize: screenHeight * 0.029 + screenWidth * 0.0625,
            letterSpacing: 1.8,
            fontFamily: 'PopB',
          ),
        ),
        Text(
          'Infected',
          style: TextStyle(
            color: kColor1,
            fontSize: screenHeight * 0.019 + screenWidth * 0.041,
            fontFamily: 'PopS',
          ),
        ),
        SizedBox(
          height: screenHeight * 0.0518,
        ),
        _hor1(),
        SizedBox(
          height: screenHeight * 0.012,
        ),
        _hor2(),
        SizedBox(
          height: screenHeight * 0.012,
        ),
        CustomCard(
          desc: _tCases,
          title: "* Today Casses",
        ),
        SizedBox(
          height: screenHeight * 0.019,
        ),
        Text(
          '* == Currently',
          style: kHeadStatsStyling,
        ),
      ],
    );
  }
}
