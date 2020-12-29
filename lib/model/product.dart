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
  //static const SALE = "sale";
  static const SIZES = "sizes";
  //static const COLORS = "colors";
  static const WHYTOREAD = "whyToRead";

  String _id;
  String _name;
  List _pictures;
  String _description;
  String _genre;
  String _author;
  int _quantity;
  List _prices;
  //bool _sale;
  bool _featured;
  //List _colors;
  List _sizes;
  String _whyToRead;
  

  String get id => _id;

  String get name => _name;

  List get pictures => _pictures;

  String get author => _author;

  String get genre => _genre;

  String get description => _description;

  int get quantity => _quantity;

  List get prices => _prices;

  bool get featured => _featured;

  //bool get sale => _sale;

  //List get colors => _colors;

  List get sizes => _sizes;

  String get whyToRead => _whyToRead;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _author = snapshot.data()[AUTHOR];
    //_sale = snapshot.data[SALE];
    _description = snapshot.data()[DESCRIPTION];
    _whyToRead = snapshot.data()[WHYTOREAD];
    _featured = snapshot.data()[FEATURED];
    _prices = snapshot.data()[PRICES];
    _genre = snapshot.data()[GENRE];
    //_colors = snapshot.data[COLORS];
    _sizes = snapshot.data()[SIZES];
    _name = snapshot.data()[NAME];
    _pictures = snapshot.data()[PICTURES];

  }
}