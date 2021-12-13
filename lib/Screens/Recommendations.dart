import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider/product.dart';
import 'package:test_app/Widgets.dart';

class Recommendations extends StatefulWidget {
  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Container(
        color: Colors.pink[50],
        child: Column(
          children: productProvider.products
              .map((item) => GestureDetector(
                    child: item.recommended
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
