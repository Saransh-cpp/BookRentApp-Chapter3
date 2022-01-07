import 'package:book_rent_app_chapter3/model/cart_item.dart';
import 'package:book_rent_app_chapter3/model/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderServices {
  String collection = "orders";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder({required String userId,
    required String id,
    required String description,
    required String status,
    required List<CartItemModel> cart,
    required double totalPrice}) {
    List<Map> convertedCart = [];

    for (CartItemModel item in cart) {
      convertedCart.add(item.toMap());
    }

    _firestore.collection(collection).doc(id).set({
      "userId": userId,
      "id": id,
      "cart": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime
          .now()
          .millisecondsSinceEpoch,
      "description": description,
      "status": status
    });
  }

  Future<List<OrderModel>> getUserOrders({required String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .get()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
