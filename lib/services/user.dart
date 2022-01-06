import 'dart:async';
import 'package:book_rent_app_chapter3/model/cart_item.dart';
import 'package:book_rent_app_chapter3/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_rent_app_chapter3/model/fav.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
      return true;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  updateUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
      return true;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  void addToCart({required String userId,required CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void addToFav({required String userId,required  FavItemModel favItem}) {
    _firestore.collection(collection).doc(userId).update({
      "fav": FieldValue.arrayUnion([favItem.toMap()])
    });
  }

  void removeFromCart({required String userId,required CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }

  void removeFromFav({required String userId,required FavItemModel favItem}) {
    _firestore.collection(collection).doc(userId).update({
      "fav": FieldValue.arrayRemove([favItem.toMap()])
    });
  }
}
