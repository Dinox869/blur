import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseAPI {
  static Stream<QuerySnapshot> playerStream =
  Firestore.instance.collection('Dennis').snapshots();

  static CollectionReference reference =
  Firestore.instance.collection('Dennis');

  static addPlayer(String item,String link,String item_no,String link_no ){
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.add({
        item_no: item,
        link_no: link,
      });
    });
  }

  static removePlayer(String id) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).delete().catchError((error) {
        print(error);
      });
    });
  }

  static updatePlayer(String id, String newName) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).updateData({
        "name": newName,
      }).catchError((error) {
        print(error);
      });
    });
  }
}