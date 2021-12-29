import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/model/order.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:
            Text("Orders", style: TextStyle(fontSize: 18, color: Colors.black)),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: userProvider.orders.length,
          itemBuilder: (_, index) {
            OrderModel _order = userProvider.orders[index];
            return ListTile(
              leading: Text(
                "\$${_order.total}",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              title: Text(_order.description),
              subtitle: Text(
                  DateTime.fromMillisecondsSinceEpoch(_order.createdAt)
                      .toString()),
              trailing: Text(_order.status,
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            );
          }),
    );
  }
}
