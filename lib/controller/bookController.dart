import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colon/model/Books.dart';

class BookController {
  static BookController instance = BookController();
  FirebaseFirestore _db;

  BookController() {
    _db = FirebaseFirestore.instance;
  }

  String _bookCollection = "Books";

  Future<void> createBookInDB(
     String _bookname, String _description, String _authorName) async {
    try {

      return await _db.collection(_bookCollection).doc().set({
        "bookName": _bookname,
        "bookDescription": _description,
        "authorName": _authorName,
        "lastSeen": DateTime.now().toUtc(),
      });
    } catch (e) {
      print(e);
    }
  }
    Stream<List<BookList>> get books {
      var _ref = _db.collection(_bookCollection);
      return _ref.get().asStream().map((_snapshot) {
        // ignore: deprecated_member_use
        return _snapshot.docs.map((_doc) {
          return BookList.fromFirestore(_doc);
        }).toList();
      });
    }
  Future<void> deleteBook(
      String _bookID) async {

      var _ref = _db.collection(_bookCollection).doc(_bookID);

      _ref.delete();
  }

  }