import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/model/paper.dart';

class FirebaseNewsPaper {
  static Stream<List<NewsPaper>> readNewPaper() => FirebaseFirestore.instance
      .collection('NewsPaper')
      // .orderBy('title', descending: true)
      .snapshots()
      .transform(transformer(NewsPaper.fromJson));

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
      transformer<T>(T Function(Map<String, dynamic> json) fromJson) =>
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
              List<T>>.fromHandlers(
            handleData: (QuerySnapshot<Map<String, dynamic>> data,
                EventSink<List<T>> sink) {
              final snaps = data.docs.map((doc) => doc.data()).toList();
              final objects = snaps.map((json) => fromJson(json)).toList();
              sink.add(objects);
            },
          );
}
