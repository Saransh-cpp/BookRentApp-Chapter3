import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';
import 'package:book_rent_app_chapter3/widgets.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key}) : super(key: key);

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
        child: ListView(
          children: productProvider.products
<<<<<<< HEAD:lib/Screens/Recommendations.dart
              .map((item) => GestureDetector(
                    child: item.recommended!
                        ? ProductCard(
                            product: item,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ))
=======
              .map((item) =>
              GestureDetector(
                child: item.recommended
                    ? ProductCard(
                  product: item,
                )
                    : const SizedBox(
                  height: 0,
                ),
              ))
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/Screens/recommendations.dart
              .toList(),
        ),
      ),
    );
  }
}
