import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';
import 'package:book_rent_app_chapter3/Widgets.dart';

class AllBooksofAGenre extends StatefulWidget {
  final String genre;

  const AllBooksofAGenre({Key? key,required this.genre}) : super(key: key);

  @override
  _AllBooksofAGenreState createState() => _AllBooksofAGenreState();
}

class _AllBooksofAGenreState extends State<AllBooksofAGenre> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Container(
        color: Colors.pink[50],
        child: Column(
          children: productProvider.products
              .map((item) => GestureDetector(
                    child: item.genre == widget.genre
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
