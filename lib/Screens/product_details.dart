import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Widgets.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  ProductDetails({
    this.product_detail_name,
    this.product_detail_picture
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink[50],
          iconTheme: IconThemeData(
            color: Colors.black
          ),

        ),
        backgroundColor: Colors.pink[50],
        body: ListView(
          physics: ScrollPhysics(),
          children: [
            Container(
              height: 300,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage(widget.product_detail_picture),
                      AssetImage(widget.product_detail_picture),
                      AssetImage(widget.product_detail_picture),
                      AssetImage(widget.product_detail_picture),
                      AssetImage(widget.product_detail_picture),
                      AssetImage(widget.product_detail_picture),
                    ],
                    animationCurve: Curves.fastOutSlowIn,
                    dotSize: 4.0,
                    indicatorBgPadding: 4.0,
                  )
              ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        widget.product_detail_name
                      ),
                    ),
                  ),
                ),
            ),
            ),
            Row(
              children: [
                Expanded(
                    child: MaterialButton(
                      elevation: 0.0,
                      onPressed: () {
                        showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text('Weeks'),
                            content: Text('Choose the time'),
                          );
                        }
                        );
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                'Time'
                              )
                          ),
                          Expanded(
                              child: Icon(
                                  Icons.arrow_drop_down_rounded
                              )
                          )
                    ],
                  ),
                    )
                ),
                Expanded(
                    child: MaterialButton(
                      elevation: 0.0,
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  'Time'
                              )
                          ),
                          Expanded(
                              child: Icon(
                                  Icons.arrow_drop_down_rounded
                              )
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: MaterialButton(
                      elevation: 0.0,
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  'Time'
                              )
                          ),
                          Expanded(
                              child: Icon(
                                  Icons.arrow_drop_down_rounded
                              )
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
        Row(
            children: [
              Expanded(
                  child: MaterialButton(
                    elevation: 0.0,
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text(
                      'Buy Now'
                    ),
        )
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart_rounded),
                onPressed: () {},
                color: Colors.red,
              ),
              IconButton(
                icon: Icon(Icons.favorite_rounded),
                onPressed: () {},
                color: Colors.red,
              ),
              ]
        ),
            Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
                Divider(),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                ),
                Divider(),
                Text(
                  'Why you should read?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  )
                ),
                Divider(),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                ),
                Divider(),
                Text(
                  'Similar Books',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Divider(),
                Container(
                  height: 360,
                  child: SimilarProducts(),
                )

              ],
            )
        ]
      ),
    )
    );
  }
}
