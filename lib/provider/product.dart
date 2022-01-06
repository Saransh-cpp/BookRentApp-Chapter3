import 'package:book_rent_app_chapter3/model/product.dart';
import 'package:book_rent_app_chapter3/services/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future search({required String productName}) async {
    productsSearched =
    await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
