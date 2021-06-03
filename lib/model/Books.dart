import 'package:cloud_firestore/cloud_firestore.dart';

class BookList {
  final String id;
  final String bookName;
  final String bookIcon;
  final String bookDescription;
  final String authorName;
  final Timestamp lastSeen;

  BookList({this.id, this.bookName, this.bookIcon,this.lastSeen,this.bookDescription,this.authorName});

  factory BookList.fromFirestore(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;

    return BookList(
      id: _snapshot.id,

      bookName: _data()["bookName"],
      bookIcon: _data()["groupIcon"],
      bookDescription: _data()["bookDescription"],
      authorName: _data()["authorName"],
      lastSeen: _data()["lastSeen"],

    );
  }
}
