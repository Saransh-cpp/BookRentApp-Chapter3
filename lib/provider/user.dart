import 'dart:async';

import 'package:test_app/model/cart_item.dart';
import 'package:test_app/model/order.dart';
import 'package:test_app/model/product.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/services/order.dart';
import 'package:test_app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:test_app/model/fav.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User? _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  Status get status => _status;

  User? get user => _user;

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
        _userModel = await _userServices.getUserById(value.user!.uid);
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
          'uid': user.user!.uid,
          'stripeId': '',
          'number': '',
          'address': '',
          'bio': '',
          'userImage': '',
        });
        _userModel = await _userServices.getUserById(user.user!.uid);
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

  Future<bool> updateUser(String? name, String? email, String? number,
      String? address, String? bio) async {
    try {
      print("CREATE USER");
      await _userServices.createUser({
        'name': name,
        'email': email,
        'uid': user!.uid,
        'stripeId': '',
        'number': number,
        'address': address,
        'bio': bio,
        'userImage': '',
      });
      _userModel = await _userServices.getUserById(user!.uid);
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

  Future<void> _onStateChanged(User? user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart({required ProductModel product, String? size}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel>? cart = _userModel!.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.pictures![0],
        "productId": product.id,
        'price': prodPrice(product: product, size: size),
        "size": size,
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);

      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user!.uid, cartItem: item);

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromCart({required CartItemModel cartItem}) async {
    try {
      _userServices.removeFromCart(userId: _user!.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addToFav({required ProductModel product}) async {
    try {
      var uuid = Uuid();
      String favItemId = uuid.v4();
      List<FavItemModel>? fav = _userModel!.fav;

      Map favItem = {
        "id": favItemId,
        "name": product.name,
        "image": product.pictures![0],
        "productId": product.id,
        "price": product.prices![0],
      };

      FavItemModel item = FavItemModel.fromMap(favItem);

      print("CART ITEMS ARE: ${fav.toString()}");
      _userServices.addToFav(userId: _user!.uid, favItem: item);

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromFav({required FavItemModel favItem}) async {
    try {
      _userServices.removeFromFav(userId: _user!.uid, favItem: favItem);
      return true;
    } catch (e) {
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user!.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user!.uid);
    notifyListeners();
  }

  prodPrice({ProductModel? product, String? size}) {
    switch (size) {
      case '1 week':
        return product!.prices![0];
      case '2 weeks':
        return product!.prices![1];
      case '3 weeks':
        return product!.prices![2];
      case '4 weeks':
        return product!.prices![3];
    }
  }
}
