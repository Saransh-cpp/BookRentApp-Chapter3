import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/loading.dart';
import 'package:book_rent_app_chapter3/Screens/all_books_of_a_genre.dart';
import 'package:book_rent_app_chapter3/Screens/product_details.dart';
import 'package:book_rent_app_chapter3/model/product.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const CustomListTile(this.icon, this.text, this.onTap, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
<<<<<<< HEAD:lib/Widgets.dart
      child: Container(
        child: InkWell(
            onTap: onTap as void Function()?,
            splashColor: Colors.orangeAccent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
=======
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
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16.0,
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_right_rounded)
              ])),
    );
  }
}

// ==========================Product Card=============================

class ProductCard extends StatelessWidget {
  final ProductModel? product;

<<<<<<< HEAD:lib/Widgets.dart
  const ProductCard({Key? key, this.product}) : super(key: key);
=======
  const ProductCard({Key? key,required this.product}) : super(key: key);
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) =>
                      ProductDetails(
                        product: product,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300]!,
<<<<<<< HEAD:lib/Widgets.dart
                    offset: Offset(-2, -1),
=======
                    offset: const Offset(-2, -1),
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart
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
                      const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Loading(),
                          )),
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: product!.pictures![0],
                          fit: BoxFit.cover,
                          height: 140,
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
<<<<<<< HEAD:lib/Widgets.dart
                    text: '${product!.name} \n',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: 'by: ${product!.author} \n\n\n\n',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextSpan(
                    text: '\$${product!.prices![0]} \t',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
=======
                    text: '${product.name} \n',
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: 'by: ${product.author} \n\n\n\n',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextSpan(
                    text: '\$${product.prices[0]} \t',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart
                  ),
                  /*TextSpan(
                    text: product.sale ? 'ON SALE ' : "",

                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  )*/
                ], style: const TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }

  //==========================Product Image===========================

/* Widget _productImage(String picture) {
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
  }*/
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
  final ProductModel? product;

<<<<<<< HEAD:lib/Widgets.dart
  const FeaturedCard({Key? key, this.product}) : super(key: key);
=======
  const FeaturedCard({Key? key, required this.product}) : super(key: key);
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                    product: product,
                  )));
        },
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(62, 168, 174, 201),
                offset: Offset(0, 9),
                blurRadius: 14,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                const Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: Loading(),
                )),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: product!.pictures![0],
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
                          child: Container())),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
<<<<<<< HEAD:lib/Widgets.dart
                            text: '${product!.name} \n',
                            style: TextStyle(fontSize: 18)),
                        TextSpan(
                            text: '\$${product!.prices![0]} \n',
                            style: TextStyle(
=======
                            text: '${product.name} \n',
                            style: const TextStyle(fontSize: 18)),
                        TextSpan(
                            text: '\$${product.prices[0]} \n',
                            style: const TextStyle(
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ]))),
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
  final String? genre;

<<<<<<< HEAD:lib/Widgets.dart
  const FeaturedProducts({Key? key, this.genre}) : super(key: key);
=======
  const FeaturedProducts({Key? key, required this.genre}) : super(key: key);
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        SizedBox(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  return productProvider.products[index].featured == true &&
                          productProvider.products[index].genre == widget.genre
                      ? FeaturedCard(
                          product: productProvider.products[index],
                        )
                      : const Text('');
                })),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => AllBooksofAGenre(
                              genre: widget.genre,
                            )));
              },
              child: IconButton(
                icon: const Icon(Icons.ballot_rounded),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}

//=============================For every Genre=======================

class PerGenre extends StatefulWidget {
  final String? genre;

<<<<<<< HEAD:lib/Widgets.dart
  const PerGenre({Key? key, this.genre}) : super(key: key);
=======
  const PerGenre({Key? key,required this.genre}) : super(key: key);
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart

  @override
  _PerGenreState createState() => _PerGenreState();
}

class _PerGenreState extends State<PerGenre> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
<<<<<<< HEAD:lib/Widgets.dart
                alignment: Alignment.centerLeft, child: new Text(widget.genre!)),
=======
                alignment: Alignment.centerLeft, child: Text(widget.genre)),
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart
          ),
        ],
      ),
      FeaturedProducts(
        genre: widget.genre,
      ),
    ]);
  }
}

//==========================All Books of a single genre==================
class AllBooksOfAGenre extends StatefulWidget {
  final String? genre;

<<<<<<< HEAD:lib/Widgets.dart
  const AllBooksOfAGenre({Key? key, this.genre}) : super(key: key);
=======
  const AllBooksOfAGenre({Key? key, required this.genre}) : super(key: key);
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/widgets.dart

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
            .map((item) => GestureDetector(
                  child: item.genre == widget.genre
                      ? ProductCard(
                          product: item,
                        )
                      : const Text(''),
                ))
            .toList(),
      ),
    );
  }
}

//====================Search=====================

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
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

//==========================Quiz Card================================

// class QuizCard extends StatefulWidget {
//
//   final String question;
//   final String option1;
//   final String option2;
//   final String option3;
//   final String option4;
//
//   const QuizCard({Key key, this.question, this.option1, this.option2, this.option3, this.option4}) : super(key: key);
//
//
//   @override
//   _QuizCardState createState() => _QuizCardState();
// }
//
// class _QuizCardState extends State<QuizCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             widget.question,
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.black
//             ),
//           ),
//           QuizOptionCard(
//             option1: widget.option1,
//             option2: widget.option2,
//             option3: widget.option3,
//             option4: widget.option4,
//           )
//
//         ],
//       ),
//     );
//   }
// }
//
// //=======================Options Card=======================
//
// class QuizOptionCard extends StatefulWidget {
//
//   final String option1;
//   final String option2;
//   final String option3;
//   final String option4;
//
//   const QuizOptionCard({Key key, this.option1, this.option2, this.option3, this.option4}) : super(key: key);
//
//   @override
//   _QuizOptionCardState createState() => _QuizOptionCardState();
// }
//
// class _QuizOptionCardState extends State<QuizOptionCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Container(
//           width: MediaQuery
//               .of(context)
//               .size
//               .width * 0.9,
//           decoration: BoxDecoration(
//               border: Border.all(
//                   color: Colors.black
//               )
//           ),
//           child: Column(
//             children: [
//               QuizOption(
//                 option: 'A',
//                 optionText: widget.option1,
//               ),
//               QuizOption(
//                 option: 'B',
//                 optionText: widget.option1,
//               ),
//               QuizOption(
//                 option: 'C',
//                 optionText: widget.option1,
//               ),
//               QuizOption(
//                 option: 'D',
//                 optionText: widget.option1,
//               ),
//             ],
//           ),
//         )
//     );
//   }
// }
//
//
// //======================Single Option==========================
//
// class QuizOption extends StatefulWidget {
//
//   final String option;
//   final String optionText;
//
//   const QuizOption({Key key, this.option, this.optionText}) : super(key: key);
//
//   @override
//   _QuizOptionState createState() => _QuizOptionState();
// }
//
// class _QuizOptionState extends State<QuizOption> {
//
//   bool color = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           color = !color;
//         });
//       },
//         child: Container(
//           color: color ? Colors.lightBlueAccent : Colors.white,
//           child: ListTile(
//             leading: Text(
//               widget.option,
//               style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black
//               )
//             ),
//             title: Text(
//                 widget.optionText,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

//==============================Quiz Try 1==================================

// class QuizCard extends StatefulWidget {
//
//   final String QuestionNumber;
//   final String question;
//   final String option1;
//   final String option2;
//   final String option3;
//   final String option4;
//   final String correctOption;
//
//   const QuizCard({Key key, this.question, this.option1, this.option2, this.option3, this.option4, this.correctOption, this.QuestionNumber}) : super(key: key);
//
//   @override
//   _QuizCardState createState() => _QuizCardState();
// }

// class _QuizCardState extends State<QuizCard> {
//
//   int counter = 10;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       widget.QuestionNumber,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Text(widget.question),
//               OptionsCard(
//                 option1: widget.option1,
//                 option2: widget.option2,
//                 option3: widget.option3,
//                 option4: widget.option4,
//                 correctOption: widget.correctOption,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OptionsCard extends StatefulWidget {
//
//   final String option1;
//   final String option2;
//   final String option3;
//   final String option4;
//   final String correctOption;
//
//   const OptionsCard({Key key, this.option1, this.option2, this.option3, this.option4, this.correctOption}) : super(key: key);
//
//   @override
//   _OptionsCardState createState() => _OptionsCardState();
// }

// class _OptionsCardState extends State<OptionsCard> {
//
//   String chosen;
//   bool answered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           ListView(
//             shrinkWrap: true,
//             physics: ScrollPhysics(),
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   if(!answered) {
//                     setState(() {
//                       chosen = widget.option1;
//                       answered = true;
//                     });
//                   }
//                 },
//                 child: Container(
//                   color: chosen == widget.option1 ?
//                   Colors.blueAccent :
//                   Colors.white,
//                   child: Row(
//                     children: [
//                       Text(
//                         widget.option1,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   if(!answered) {
//                     setState(() {
//                       chosen = widget.option2;
//                       answered = true;
//                     });
//                   }
//                 },
//                 child: Container(
//                   color: chosen == widget.option2 ?
//                   Colors.blueAccent:
//                   Colors.white,
//                   child: Row(
//                     children: [
//                       Text(
//                         widget.option2,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   if(!answered) {
//                     setState(() {
//                       chosen = widget.option3;
//                       answered = true;
//                     });
//                   }
//                 },
//                 child: Container(
//                   color: chosen == widget.option3 ?
//                   Colors.blueAccent :
//                   Colors.white,
//                   child: Row(
//                     children: [
//                       Text(
//                         widget.option3,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   if(!answered) {
//                     setState(() {
//                       chosen = widget.option4;
//                       answered = true;
//                     });
//                   }
//                 },
//                 child: Container(
//                   color: chosen == widget.option4 ?
//                   Colors.blueAccent :
//                   Colors.white,
//                   child: Row(
//                     children: [
//                       Text(
//                         widget.option4,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
