import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_item.dart';
import 'fav.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";
  static const FAV = 'fav';
  static const NUMBER = 'number';
  static const ADDRESS = 'address';
  static const USERIMAGE = 'userImage';
  static const BIO = 'bio';

  String? _name;
  String? _email;
  String? _id;
  String? _stripeId;
  String? _number;
  String? _address;
  String? _userImage;
  String? _bio;
  double _priceSum = 0;

//  getters
  String? get name => _name;

  String? get email => _email;

  String? get id => _id;

  String? get stripeId => _stripeId;

  String? get number => _number;

  String? get address => _address;

  String? get userImage => _userImage;

  String? get bio => _bio;

  List<CartItemModel>? cart;
  List<FavItemModel>? fav;
  double? totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()![NAME];
    _email = snapshot.data()![EMAIL];
    _id = snapshot.data()![ID];
    _address = snapshot.data()![ADDRESS] ?? "";
    _number = snapshot.data()![NUMBER] ?? '';
    _userImage = snapshot.data()![USERIMAGE] ?? "";
    _stripeId = snapshot.data()![STRIPE_ID] ?? "";
    _bio = snapshot.data()![BIO] ?? "";
    cart = _convertCartItems(snapshot.data()![CART] ?? []);
    fav = _convertFavItems(snapshot.data()![FAV] ?? []);
    totalCartPrice = snapshot.data()![CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data()![CART]);
  }

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart as Iterable<Map<dynamic, dynamic>>) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  List<FavItemModel> _convertFavItems(List fav) {
    List<FavItemModel> convertedFav = [];
    for (Map favItem in fav as Iterable<Map<dynamic, dynamic>>) {
      convertedFav.add(FavItemModel.fromMap(favItem));
    }
    return convertedFav;
  }

  double getTotalPrice({List? cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart as Iterable<Map<dynamic, dynamic>>) {
      _priceSum += cartItem["price"];
    }

    double total = _priceSum;
    return total;
  }
}
