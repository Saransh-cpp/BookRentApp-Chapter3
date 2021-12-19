import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';

import 'package:test_app/model/product.dart';
import 'package:test_app/provider/app.dart';
import 'package:test_app/provider/user.dart';

import 'package:uuid/uuid.dart';
import 'package:test_app/services/order.dart';
import 'package:test_app/model/cart_item.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldMessengerState>();
  String size = "";
  OrderServices _orderServices = OrderServices();

  @override
  void initState() {
    super.initState();
    size = widget.product.sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink[50],
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            widget.product.name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.pink[50],
        body: ListView(
          physics: ScrollPhysics(),
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  GridTile(
                    child: Container(
                      color: Colors.white,
                      child: Carousel(
                        boxFit: BoxFit.cover,
                        images: [
                          Image.network(
                            widget.product.pictures[0],
                            fit: BoxFit.fill,
                          ),
                          Image.network(
                            widget.product.pictures[1],
                            fit: BoxFit.fill,
                          ),
                          Image.network(widget.product.pictures[2]),
                        ],
                        animationCurve: Curves.fastOutSlowIn,
                        dotSize: 4.0,
                        indicatorBgPadding: 4.0,
                      ),
                    ),
                    footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                        title: Center(
                          child: Text(''
                              //widget.product.name
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ClipOval(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: IconButton(
                            tooltip: "Add to Favourites",
                            icon: Icon(
                              Icons.favorite_rounded,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              appProvider.changeIsLoading();
                              bool success = await userProvider.addToFav(
                                  product: widget.product);
                              if (success) {
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Added to Fav!")));
                                userProvider.reloadUserModel();
                                appProvider.changeIsLoading();
                                return;
                              } else {
                                _key.currentState.showSnackBar(SnackBar(
                                    content: Text("Not added to Fav!")));
                                appProvider.changeIsLoading();
                                return;
                              }
                              appProvider.changeIsLoading();
                            },
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Expanded(
                    child: ProdPrice(),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownButton<String>(
                          enableFeedback: true,
                          icon: Icon(Icons.timelapse),
                          value: size,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                          items: widget.product.sizes
                              .map<DropdownMenuItem<String>>(
                                (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              size = value;
                            });
                          }),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.white,
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 10.0,
                      ),
                      Text(
                        'Check Out',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  onPressed: () {
                    double pricef = ProdPriceM();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: Container(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'You will be charged ${pricef} upon delivery!',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: RaisedButton(
                                        onPressed: () async {
                                          var uuid = Uuid();
                                          String id = uuid.v4();
                                          if (userProvider.userModel.address !=
                                                  '' &&
                                              userProvider.userModel.number !=
                                                  '') {
                                            _orderServices.createOrder(
                                                userId: userProvider.user.uid,
                                                id: id,
                                                description:
                                                    widget.product.name,
                                                status: "ordered",
                                                totalPrice: pricef,
                                                cart: userProvider
                                                    .userModel.cart);
                                            _key.currentState.showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Order created!")));
                                            Navigator.pop(context);
                                          } else {
                                            _key.currentState.showSnackBar(SnackBar(
                                                content: Text(
                                                    'Please add address and number')));
                                          }
                                        },
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: const Color(0xFF1BC0C5),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: RaisedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Reject",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: Colors.red),
                                    ) //}
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
                // RaisedButton(
                //   onPressed: () async {
                //     var uuid = Uuid();
                //     String id = uuid.v4();
                //     if (userProvider.userModel.address != '' &&
                //         userProvider.userModel.number != '') {
                //       _orderServices.createOrder(
                //           userId: userProvider.user.uid,
                //           id: id,
                //           description: widget.product.name,
                //           status: "ordered",
                //           totalPrice: 0,
                //           cart: userProvider.userModel.cart);
                //       // for (CartItemModel cartItem in userProvider.userModel.cart) {
                //       //   bool value =
                //       //       await userProvider.removeFromCart(cartItem: cartItem);
                //       //   if (value) {
                //       //     userProvider.reloadUserModel();
                //       //     print("Item added to cart");
                //       //     _key.currentState.showSnackBar(
                //       //         SnackBar(content: Text("Removed from Cart!")));
                //       //   } else {
                //       //     print("ITEM WAS NOT REMOVED");
                //       //   }
                //       // }
                //       _key.currentState
                //           .showSnackBar(SnackBar(content: Text("Order created!")));
                //       Navigator.pop(context);
                //     } else {
                //       _key.currentState.showSnackBar(
                //           SnackBar(content: Text('Please add address and number')));
                //     }
                //   },
                //   child: Text(
                //     "Accept",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   color: const Color(0xFF1BC0C5),
                // ),
                // SizedBox(
                //   width: 320.0,
                //   child: RaisedButton(
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       child: Text(
                //         "Reject",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       color: Colors.red),
                // ),
                appProvider.isLoading
                    ? Loading()
                    : ElevatedButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_shopping_cart_rounded,
                              color: Colors.white,
                            ),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 10.0,
                            ),
                            Text(
                              'Add to Cart',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        onPressed: () async {
                          appProvider.changeIsLoading();
                          bool success = await userProvider.addToCart(
                              product: widget.product, size: size);
                          if (success) {
                            _key.currentState.showSnackBar(
                                SnackBar(content: Text("Added to Cart!")));
                            userProvider.reloadUserModel();
                            appProvider.changeIsLoading();
                            return;
                          } else {
                            _key.currentState.showSnackBar(
                                SnackBar(content: Text("Not added to Cart!")));
                            appProvider.changeIsLoading();
                            return;
                          }
                          appProvider.changeIsLoading();
                        },
                      ),
              ],
            ),
            Divider(
              thickness: 2.0,
            ),
            Column(
              children: [
                detailsTile(
                  "Description",
                  [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.description,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2.0,
                ),
                detailsTile(
                  'Why you should read?',
                  [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.product.whyToRead),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2.0,
                ),
                detailsTile(
                  'Similar Books',
                  [
                    /*Container(
                  height: 360,
                  child: SimilarProducts(),
                )*/
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget detailsTile(String title, List<Widget> children) {
    return ExpansionTile(
      backgroundColor: Colors.pink[100],
      tilePadding: EdgeInsets.all(4.0),
      textColor: Colors.black,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      childrenPadding: EdgeInsets.symmetric(horizontal: 16),
      children: children,
    );
  }

  ProdPrice() {
    TextStyle productPriceTextStyle =
        TextStyle(color: Colors.black, fontSize: 24);
    switch (size) {
      case '1 week':
        return Text(
          'Price: ${widget.product.prices[0]}',
          style: productPriceTextStyle,
        );
        break;
      case '2 weeks':
        return Text(
          'Price: ${widget.product.prices[1]}',
          style: productPriceTextStyle,
        );
        break;
      case '3 weeks':
        return Text(
          'Price: ${widget.product.prices[2]}',
          style: productPriceTextStyle,
        );
        break;
      case '4 weeks':
        return Text(
          'Price: ${widget.product.prices[3]}',
          style: productPriceTextStyle,
        );
        break;
      default:
        return Text('select a time');
    }
  }

  ProdPriceM() {
    switch (size) {
      case '1 week':
        return widget.product.prices[0];
        break;
      case '2 weeks':
        return widget.product.prices[1];
        break;
      case '3 weeks':
        return widget.product.prices[2];
        break;
      case '4 weeks':
        return widget.product.prices[3];
        break;
      default:
        return 0;
    }
  }
}
