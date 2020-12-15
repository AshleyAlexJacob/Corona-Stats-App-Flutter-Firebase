import 'package:coronastats/models/faq.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brews = context.watch<List<FAQ>>();
    // print(brews[0].title);
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          isThreeLine: true,
          title: Text(brews[index].question,
              style: TextStyle(color: Colors.white, fontSize: 18)),
          subtitle: Text('\n' + brews[index].answer + '\n',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'PopR')),
        );
      },
      itemCount: brews.length,
    );
  }
}
