import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Screens/allBooksofAGenre.dart';
import 'package:test_app/Screens/product_details.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:test_app/model/product.dart';
import 'package:test_app/provider/product.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 56 : 200,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.blue[300]),
                    border: InputBorder.none),
              )
                  : null,
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.blue[900],
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        child: InkWell(
          onTap: onTap,
            splashColor: Colors.orangeAccent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(text,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),),
                      ),

                    ],
                  ),
                  Icon(Icons.arrow_right_rounded)
                ]
            )
        ),
      ),
    );
  }
}

// ==========================Product Card=============================

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (c) => ProductDetails(product: product,)));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(-2, -1),
                    blurRadius: 5),
              ]),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Loading(),
                          )),
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: product.pictures[0],
                          fit: BoxFit.cover,
                          height: 140,
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${product.name} \n',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: 'by: ${product.author} \n\n\n\n',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextSpan(
                    text: '\$${product.prices[0]} \t',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  /*TextSpan(
                    text: product.sale ? 'ON SALE ' : "",

                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  )*/
                ], style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }

  //==========================Product Image===========================

  Widget _productImage(String picture) {
    if (picture == null) {
      return Container(
        child: Text(
          'No Image',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            product.pictures[0],
            height: 140,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}



/*class Products extends StatefulWidget {

  final ProductModel product;

  const Products({Key key, this.product}) : super(key: key);


  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 400,
        width: 500,
        color: Colors.pink[50],
          child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: product_list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                return Single_prod(
                  prod_name: product_list[index]['name'],
                  prod_picture: product_list[index]['picture'],

                );
              }),


      ),
    );
  }
}*/

/*class Single_prod extends StatelessWidget {

  final ProductModel product;

  const Single_prod({Key key, this.product}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product.name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ProductDetails(product: product,))),
              child: GridTile(
                  footer: Container(
                    height: 50,
                    color: Colors.white70,
                    child: ListTile(
                      leading: Container(
                        height: 1000,
                        width: 50,
                        child: Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                        ),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    product.pictures[0],
                    fit: BoxFit.cover,
                  )

              ),
            ),
          )),
    );
  }
}*/

// class SimilarProducts extends StatefulWidget {
//   @override
//   _SimilarProductsState createState() => _SimilarProductsState();
// }

// class _SimilarProductsState extends State<SimilarProducts> {
//
//   var product_list = [
//     {
//       "name": "Angel & Demons",
//       "picture": "images/IMG_20201210_170910_696.jpg",
//
//     },
//     {
//       "name": "book 2",
//       "picture": "images/IMG_20201210_170758_134.jpg",
//
//     },
//     {
//       "name": "book 3",
//       "picture": "images/IMG_20201210_171229_060.jpg",
//
//     },
//     {
//       "name": "book 4",
//       "picture": "images/IMG_20201210_171229_060.jpg",
//
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         height: 400,
//         width: 500,
//         color: Colors.pink[50],
//         child: GridView.builder(
//             physics: ScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: product_list.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             itemBuilder: (BuildContext context, int index) {
//               return SimilarSingle_prod(
//                 prod_name: product_list[index]['name'],
//                 prod_picture: product_list[index]['picture'],
//
//               );
//             }),
//
//
//       ),
//     );
//   }
// }

// class SimilarSingle_prod extends StatelessWidget {
//   final prod_name;
//   final prod_picture;
//
//
//   SimilarSingle_prod({
//     this.prod_name,
//     this.prod_picture,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//           tag: prod_name,
//           child: Material(
//             child: InkWell(
//               onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context)=>ProductDetails())),
//               child: GridTile(
//                   footer: Container(
//                     height: 50,
//                     color: Colors.white70,
//                     child: ListTile(
//                       leading: Container(
//                         height: 1000,
//                         width: 50,
//                         child: Text(
//                           prod_name,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   child: Image.asset(
//                     prod_picture,
//                     fit: BoxFit.cover,
//                   )
//
//               ),
//             ),
//           )),
//     );
//   }
// }

// class CartProducts extends StatefulWidget {
//   @override
//   _CartProductsState createState() => _CartProductsState();
// }

// class _CartProductsState extends State<CartProducts> {
//
//   var product_list = [
//     {
//       "name": "Angel & Demons",
//       "picture": "images/IMG_20201210_170910_696.jpg",
//       "price": 30,
//       "time": "1 weeks",
//     },
//     {
//       "name": "book 2",
//       "picture": "images/IMG_20201210_170758_134.jpg",
//       "price": 30,
//       "time": "2 weeks",
//     },
//
// ];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: product_list.length,
//       itemBuilder: (context, index) {
//         return SingleCartProduct(
//           prod_name: product_list[index]["name"],
//           prod_picture: product_list[index]["picture"],
//           time: product_list[index]["time"],
//           prod_price: product_list[index]["price"],
//         );
//         },);
//   }
// }

// class SingleCartProduct extends StatefulWidget {
//   final prod_name;
//   final prod_picture;
//   final time;
//   final prod_price;
//
//   SingleCartProduct({
//     this.prod_name,
//     this.prod_picture,
//     this.prod_price,
//     this.time,
// });
//
//   @override
//   _SingleCartProductState createState() => _SingleCartProductState();
// }

// class _SingleCartProductState extends State<SingleCartProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Image.asset(widget.prod_picture, width: 100,),
//         title: Text(
//           widget.prod_name
//         ),
//         subtitle: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Text(
//                       'Time:'
//                     ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Text(
//                     widget.time,
//                     style: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Rs ${widget.prod_price}",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red
//                 ),
//               ),
//             )
//           ],
//         ),
//         trailing: Column(
//           children: [
//             IconButton(
//               icon: Icon(Icons.delete_rounded),
//               onPressed: () {},
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// ====================== Featured Card ==========================

class FeaturedCard extends StatelessWidget {
  final ProductModel product;

  const FeaturedCard({Key key, this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>ProductDetails(product: product,)));
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                Color.fromARGB(62, 168, 174, 201),
                offset: Offset(0, 9),
                blurRadius: 14,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: product.pictures[0],
                    fit: BoxFit.cover,
                    height: 220,
                    width: 200,
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),

                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container()
                      )),
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: RichText(
                          text: TextSpan(
                              children: [
                        TextSpan(
                            text: '${product.name} \n',
                            style: TextStyle(
                                fontSize: 18
                            )
                        ),
                        TextSpan(
                            text: '\$${product.prices[0]} \n',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            )
                        ),
                              ]
                          )
                      )
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ===================== Featured products =================

class FeaturedProducts extends StatefulWidget {

  final String genre;

  const FeaturedProducts({Key key, this.genre}) : super(key: key);

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        Container(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  return productProvider.products[index].featured == true && productProvider.products[index].genre == widget.genre
                      ? FeaturedCard(
                    product: productProvider.products[index],
                  )
                  : Text('');
                }
                )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) => allBooksofAGenre(genre: widget.genre,)));
              },
              child: IconButton(
                icon:  Icon(
                  Icons.ballot_rounded
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//=============================For every Genre=======================

class perGenre extends StatefulWidget {

  final String genre;

  const perGenre({Key key, this.genre}) : super(key: key);

  @override
  _perGenreState createState() => _perGenreState();
}

class _perGenreState extends State<perGenre> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                      widget.genre
                  )
              ),
            ),
          ],
        ),
        FeaturedProducts(
          genre: widget.genre,
        ),
      ]
    );
  }
}

//==========================All Books of a single genre==================
class AllBooksOfAGenre extends StatefulWidget {

  final String genre;

  const AllBooksOfAGenre({Key key, this.genre}) : super(key: key);


  @override
  _AllBooksOfAGenreState createState() => _AllBooksOfAGenreState();
}

class _AllBooksOfAGenreState extends State<AllBooksOfAGenre> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      color: Colors.red,
      child: Column(
        children: productProvider.products
            .map((item) =>
            GestureDetector(
              child: item.genre == widget.genre ? ProductCard(
                product: item,
              )
                  : Text(''),
            )
        ).toList(),
      ),
    );
  }
}

//====================Search=====================

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.white,),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white,),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "E.g: formal dress",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blueGrey[300],
            ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey[300],
            ),
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}










