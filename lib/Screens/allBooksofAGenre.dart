import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider/product.dart';
import 'package:test_app/Widgets.dart';

class allBooksofAGenre extends StatefulWidget {

  final String genre;

  const allBooksofAGenre({Key key, this.genre}) : super(key: key);

  @override
  _allBooksofAGenreState createState() => _allBooksofAGenreState();
}

class _allBooksofAGenreState extends State<allBooksofAGenre> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Container(
        color: Colors.pink[50],
        child: Column(
          children: productProvider.products
              .map((item) =>
              GestureDetector(
                child: item.genre == widget.genre ? ProductCard(
                  product: item,
                )
                    : SizedBox(
                  height: 0,
                ),
              )
          ).toList(),
        ),
      ),
    );
  }
}
