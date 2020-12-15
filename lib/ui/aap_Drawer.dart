import 'package:coronastats/screens/aboutMe.dart';
import 'package:coronastats/screens/faqScreen.dart';
import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:coronastats/ui/appDrawerItem.dart';
import 'package:coronastats/screens/main_Screen.dart';
import 'package:coronastats/ui/map.dart';
import 'package:coronastats/screens/inProgress.dart';
import 'package:coronastats/screens/precautions.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kColor3,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Text(
                'MENU',
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
            ),
            AppDrawerItem(
              mark: Icons.map,
              text: 'Map',
              route: AppMap(),
            ),
            AppDrawerItem(
              mark: Icons.perm_data_setting,
              text: 'Statistics',
              route: MainScreen(),
            ),
            AppDrawerItem(
              mark: Icons.do_not_disturb_alt,
              text: 'Precautions',
              route: Precautions(),
            ),
            AppDrawerItem(
                mark: Icons.question_answer, text: 'FAQ', route: FAQSCREEN()),
            AppDrawerItem(
              mark: Icons.account_box,
              text: 'About Developer',
              route: AboutMe(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 2),
              height: 100,
              width: 300,
              child: Image(
                image: AssetImage('images/who.png'),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
              child: Text(
                'Outline guidelines on how to stay healthy\nas per WHO recommendations',
                style: TextStyle(color: Colors.white, fontSize: 12.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
