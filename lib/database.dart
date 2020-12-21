//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//
/*class DatabaseService{

  final String uid;
  DatabaseService({
    this.uid
});

  
  // collection reference
  final CollectionReference bookCollection = Firestore.instance.collection('books');

  Future updateUserData(String userInfo, String name) async{
    return await bookCollection.doc(uid).set({
      'name': name,
      'email': email,
      'url': Image
    });
  }

  Stream<QuerySnapshot> get books {
    return bookCollection.snapshots();
  }
}*/