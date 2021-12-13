import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider/product.dart';
import 'package:test_app/Widgets.dart';

class BestSellers extends StatefulWidget {
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
        child: Column(
          children: productProvider.products
              .map((item) => GestureDetector(
                    child: item.bestseller
                        ? ProductCard(
                            product: item,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
