import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/product_details.dart';
import 'package:test_app/Widgets.dart';
import 'package:test_app/provider/product.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Products",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.length < 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("No products Found",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 22,
                        )),
                  ],
                )
              ],
            )
          : ListView.builder(
              itemCount: productProvider.productsSearched.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => ProductDetails(
                                  product: productProvider
                                      .productsSearched[index])));
                    },
                    child: ProductCard(
                        product: productProvider.productsSearched[index]));
              }),
    );
  }
}
