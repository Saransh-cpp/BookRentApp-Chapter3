import 'dart:async';

import 'package:test_app/Screens/product_details.dart';
import 'package:test_app/Utility/auth.dart';
import 'package:test_app/model/cart_item.dart';
import 'package:test_app/model/order.dart';
import 'package:test_app/model/product.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/services/order.dart';
import 'package:test_app/services/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:test_app/model/fav.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();

  UserModel _userModel;

//  getter
  UserModel get userModel => _userModel;

  Status get status => _status;

  User get user => _user;

  // public variables
  List<OrderModel> orders = [];

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        _userModel = await _userServices.getUserById(value.user.uid);
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      // Changing the status to authenticating
      _status = Status.Authenticating;
      notifyListeners();
      final Auth googleAuth = Auth();
      // calling the async function which can return null or a User
      dynamic result = await googleAuth.googleSignIn();
      // if the result is null, sign in failed
      if (result == null) {
        // change the status to unauthenticated and return false
        _status = Status.Unauthenticated;
        notifyListeners();
        return false;
      }
      print(result.uid);
      // if result returns a User, create a user in app and return true
      _userModel = await _userServices.getUserById(result.uid);
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  // Future updateUserData(String name,  String email, String number, String address) async{
  //   return await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
  //       {
  //         'name': name,
  //         'email': email,
  //         'number': number
  //
  //       });
  // }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        print("CREATE USER");
        _userServices.createUser({
          'name': name,
          'email': email,
          'uid': user.user.uid,
          'stripeId': '',
          'number': '',
          'address': '',
          'bio': '',
          'userImage': '',
        });
        _userModel = await _userServices.getUserById(user.user.uid);
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> updateUser(String name, String email, String number,
      String address, String bio) async {
    try {
      // _status = Status.Authenticating;
      // notifyListeners();
      print("CREATE USER");
      await _userServices.createUser({
        'name': name,
        'email': email,
        'uid': user.uid,
        'stripeId': '',
        'number': number,
        'address': address,
        'bio': bio,
        'userImage': '',
      });
      _userModel = await _userServices.getUserById(user.uid);
      notifyListeners();

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart({ProductModel product, String size}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.pictures[0],
        "productId": product.id,
        'price': ProdPrice(product: product, size: size),
        // size == '1 week' ? product.prices[0] : product.prices[1],
        // "price": product.prices[0],
        "size": size,
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    //print("THE PRODUCT IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      //print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> addToFav({ProductModel product}) async {
    try {
      var uuid = Uuid();
      String favItemId = uuid.v4();
      List<FavItemModel> fav = _userModel.fav;

      Map favItem = {
        "id": favItemId,
        "name": product.name,
        "image": product.pictures[0],
        "productId": product.id,
        "price": product.prices[0],
      };

      FavItemModel item = FavItemModel.fromMap(favItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${fav.toString()}");
      _userServices.addToFav(userId: _user.uid, favItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromFav({FavItemModel favItem}) async {
    //print("THE PRODUCT IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromFav(userId: _user.uid, favItem: favItem);
      return true;
    } catch (e) {
      //print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  ProdPrice({ProductModel product, String size}) {
    switch (size) {
      case '1 week':
        return product.prices[0];
      case '2 weeks':
        return product.prices[1];
      case '3 weeks':
        return product.prices[2];
      case '4 weeks':
        return product.prices[3];
    }
  }
}
