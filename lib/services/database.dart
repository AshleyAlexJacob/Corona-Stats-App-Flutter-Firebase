import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronastats/models/prevention.dart';
import 'package:coronastats/models/faq.dart';

class DatabaseHelper {
  final CollectionReference prevent =
      FirebaseFirestore.instance.collection('prevention');

  final CollectionReference faq = FirebaseFirestore.instance.collection('faq');

  List<Prevention> _preventionData(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Prevention(
          title: doc.data()['title'] ?? '',
          desc: doc.data()['desc'] ?? '',
          url: doc.data()['url'] ?? '');
    }).toList();
  }

  List<FAQ> _faqData(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return FAQ(
        answer: doc.data()['answer'] ?? '',
        question: doc.data()['question'] ?? '',
      );
    }).toList();
  }

  Stream<List<Prevention>> get data {
    return prevent.snapshots().map(_preventionData);
  }

  Stream<List<FAQ>> get faqData {
    return faq.snapshots().map(_faqData);
  }
}
