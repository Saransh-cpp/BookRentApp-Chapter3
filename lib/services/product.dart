import 'package:book_rent_app_chapter3/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices {
  String collection = "books";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> searchProducts({required String productName}) {
    String searchKey = productName[0].toLowerCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }
}
