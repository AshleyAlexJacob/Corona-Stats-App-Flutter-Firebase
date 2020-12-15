import 'package:flutter/material.dart';
import 'package:coronastats/models/prevention.dart';
import 'package:provider/provider.dart';

class PrecautionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brews = context.watch<List<Prevention>>();
    // print(brews[0].title);
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          isThreeLine: true,
          title: Text(brews[index].title,
              style: TextStyle(color: Colors.white, fontSize: 18)),
          subtitle: Text('\n' + brews[index].desc,
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'PopR')),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            backgroundImage: NetworkImage(brews[index].url),
          ),
        );
      },
      itemCount: brews.length,
    );
  }
}
