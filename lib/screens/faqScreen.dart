import 'package:coronastats/constants.dart';
import 'package:coronastats/models/faq.dart';
import 'package:coronastats/screens/faqList.dart';
import 'package:coronastats/ui/aap_Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coronastats/services/database.dart';

class FAQSCREEN extends StatefulWidget {
  @override
  _FAQSCREENState createState() => _FAQSCREENState();
}

class _FAQSCREENState extends State<FAQSCREEN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColor4,
        appBar: AppBar(
          backgroundColor: kColor4,
          elevation: 0,
        ),
        drawer: AppDrawer(),
        body: StreamProvider<List<FAQ>>.value(
            initialData: [],
            value: DatabaseHelper().faqData,
            child: FAQList()));
  }
}
