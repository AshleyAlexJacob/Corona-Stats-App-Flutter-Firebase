import 'package:coronastats/constants.dart';
import 'package:coronastats/screens/precautionList.dart';
import 'package:coronastats/ui/aap_Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coronastats/models/prevention.dart';
import 'package:coronastats/services/database.dart';

class Precautions extends StatefulWidget {
  @override
  _PrecautionsState createState() => _PrecautionsState();
}

class _PrecautionsState extends State<Precautions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColor4,
          elevation: 0,
        ),
        drawer: AppDrawer(),
        backgroundColor: kColor4,
        body: StreamProvider<List<Prevention>>.value(
            initialData: [],
            value: DatabaseHelper().data,
            child: PrecautionList()));
  }
}
