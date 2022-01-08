import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/product_details.dart';
import 'package:book_rent_app_chapter3/widgets.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';

class ProductSearchScreen extends StatelessWidget {
  const ProductSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text(
          "Products",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
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
                          builder: (c) =>
                              ProductDetails(
                                  product: productProvider
                                      .productsSearched[index])));
                },
                child: ProductCard(
                    product: productProvider.productsSearched[index]));
          }),
    );
  }
}
