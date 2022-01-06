import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String? _id;
  String? _description;
  String? _userId;
  String? _status;
  int? _createdAt;
  double? _total;

  String get id => _id!;

  String get description => _description!;

  String get userId => _userId!;

  String get status => _status!;

  double get total => _total!;

  int get createdAt => _createdAt!;

  List? cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = (snapshot.data()! as Map<String, dynamic>)[ID];
    _description = (snapshot.data()! as Map<String, dynamic>)[DESCRIPTION];
    _total = (snapshot.data()! as Map<String, dynamic>)[TOTAL];
    _status = (snapshot.data()! as Map<String, dynamic>)[STATUS];
    _userId = (snapshot.data()! as Map<String, dynamic>)[USER_ID];
    _createdAt = (snapshot.data()! as Map<String, dynamic>)[CREATED_AT];
    cart = (snapshot.data()! as Map<String, dynamic>)[CART];
  }
}
