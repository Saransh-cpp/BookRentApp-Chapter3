import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';
import 'package:book_rent_app_chapter3/widgets.dart';

class BestSellers extends StatefulWidget {
  const BestSellers({Key? key}) : super(key: key);

  @override
  _BestSellersState createState() => _BestSellersState();
}

class _BestSellersState extends State<BestSellers> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Container(
        color: Colors.pink[50],
        child: ListView(
          children: productProvider.products
              .map((item) =>
              GestureDetector(
                child: item.bestseller
                    ? ProductCard(
                  product: item,
                )
                    : const SizedBox(
                  height: 0,
                ),
              ))
              .toList(),
        ),
      ),
    );
  }
}
