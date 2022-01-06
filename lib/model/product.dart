// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURES = "pictures";
  static const PRICES = "prices";
  static const DESCRIPTION = "description";
  static const GENRE = "genre";
  static const FEATURED = "featured";
  static const QUANTITY = "quantity";
  static const AUTHOR = "author";

  static const SIZES = "sizes";

  static const WHYTOREAD = "whyToRead";
  static const RECOMMENDED = "recommended";
  static const BESTSELLER = "bestseller";

  String? _id;
  String? _name;
  List? _pictures;
  String? _description;
  String? _genre;
  String? _author;
  int? _quantity;
  List? _prices;

  bool? _featured;
  bool? _recommended;
  bool? _bestseller;

  List? _sizes;
  String? _whyToRead;

  String get id => _id!;

  String get name => _name!;

  List get pictures => _pictures!;

  String get author => _author!;

  String get genre => _genre!;

  String get description => _description!;

  int get quantity => _quantity!;

  List get prices => _prices!;

  bool get featured => _featured!;

  bool get recommended => _recommended!;

  bool get bestseller => _bestseller!;

  List get sizes => _sizes!;

  String get whyToRead => _whyToRead!;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = (snapshot.data()! as Map<String, dynamic>)[ID];
    _author = (snapshot.data()! as Map<String, dynamic>)[AUTHOR];
    //_sale = snapshot.data[SALE];
    _description = (snapshot.data()! as Map<String, dynamic>)[DESCRIPTION];
    _whyToRead = (snapshot.data()! as Map<String, dynamic>)[WHYTOREAD];
    _featured = (snapshot.data()! as Map<String, dynamic>)[FEATURED];
    _recommended = (snapshot.data()! as Map<String, dynamic>)[RECOMMENDED];
    _bestseller = (snapshot.data()! as Map<String, dynamic>)[BESTSELLER];
    _prices = (snapshot.data()! as Map<String, dynamic>)[PRICES];
    _genre = (snapshot.data()! as Map<String, dynamic>)[GENRE];

    _sizes = (snapshot.data()! as Map<String, dynamic>)[SIZES];
    _name = (snapshot.data()! as Map<String, dynamic>)[NAME];
    _pictures = (snapshot.data()! as Map<String, dynamic>)[PICTURES];
  }
}
