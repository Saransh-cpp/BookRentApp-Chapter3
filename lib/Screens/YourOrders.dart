import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/Loading.dart';
import 'package:book_rent_app_chapter3/Screens/product_details.dart';
import 'package:book_rent_app_chapter3/Screens/Recommendations.dart';
import 'package:book_rent_app_chapter3/model/cart_item.dart';
import 'package:book_rent_app_chapter3/provider/app.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';
import 'package:book_rent_app_chapter3/services/order.dart';
import 'package:test_app/Screens/Recommendations.dart';
import 'package:uuid/uuid.dart';

// const String testDevice = 'ca-app-pub-2019702807519064~1210594994';

class YourOrders extends StatefulWidget {
  @override
  _YourOrdersState createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {

  OrderServices _orderServices = OrderServices();
  ProductDetails productDetails = ProductDetails();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    bool isCartEmpty = userProvider.userModel.cart.length == 0;
    _scaffoldContext = context;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.pink,
            ),
            backgroundColor: Colors.pink[50],
            elevation: 0,
            title: Text(
              "My Cart",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          backgroundColor: Colors.pink[50],
          body: appProvider.isLoading
              ? Loading()
              : isCartEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/emptycart.png',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Card(
                            elevation: 3,
                            shadowColor: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'You have nothing in your cart ,click on ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pinkAccent),
                                    ),
                                    TextSpan(
                                      text: 'add item',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: ' to find your recommendation.',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pinkAccent),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: userProvider.userModel.cart.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(3, 2),
                                      blurRadius: 30)
                                ]),
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (c) => ProductDetails
                                //       (product: product)));
                              },
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      userProvider.userModel.cart[index].image,
                                      height: 120,
                                      width: 140,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: userProvider.userModel
                                                        .cart[index].name +
                                                    "\n",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                // text: userProvider.userModel
                                                //     .cart[index].size == '1 week'
                                                //     ? userProvider.userModel
                                                //     .cart[index].price[0]
                                                //     : userProvider.userModel
                                                //     .cart[index].price[1],
                                                text:
                                                    "\$${userProvider.userModel.cart[index].price} \n\n",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ]),
                                        ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          appProvider.changeIsLoading();
                                          bool success =
                                              await userProvider.removeFromCart(
                                                  cartItem: userProvider
                                                      .userModel.cart![index]);
                                          if (success) {
                                            userProvider.reloadUserModel();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Removed from Cart!")));
                                            appProvider.changeIsLoading();
                                            return;
                                          } else {
                                            appProvider.changeIsLoading();
                                          }
                                        })
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          bottomNavigationBar: Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Total: ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: " \$${userProvider.userModel.totalCartPrice}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.normal)),
                    ]),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 3,
                    shadowColor: Colors.grey,
                    child: TextButton(
                        onPressed: () {
                          if (userProvider.userModel.totalCartPrice == 0) {
                            _bannerAd.dispose();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => Recommendations()));
                            return;
                          }
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Container(
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'You will be charged \$${userProvider.userModel.totalCartPrice} upon delivery!',
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: 320.0,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                var uuid = Uuid();
                                                String id = uuid.v4();
                                                if (userProvider.userModel
                                                            .address !=
                                                        '' &&
                                                    userProvider
                                                            .userModel.number !=
                                                        '') {
                                                  String orderNames =
                                                      '${userProvider.userModel.cart![0].name}';
                                                  for (int i = 1;
                                                      i <
                                                          userProvider.userModel
                                                              .cart!.length;
                                                      i++) {
                                                    orderNames = orderNames +
                                                        ', ${userProvider.userModel.cart![i].name}';
                                                  }
                                                  _orderServices.createOrder(
                                                      userId:
                                                          userProvider.user.uid,
                                                      id: id,
                                                      description: orderNames,
                                                      status: "ordered",
                                                      totalPrice: userProvider
                                                          .userModel
                                                          .totalCartPrice!,
                                                      cart: userProvider
                                                          .userModel.cart!);
                                                  for (CartItemModel cartItem
                                                      in userProvider
                                                          .userModel.cart!) {
                                                    bool value =
                                                        await userProvider
                                                            .removeFromCart(
                                                                cartItem:
                                                                    cartItem);
                                                    if (value) {
                                                      userProvider
                                                          .reloadUserModel();
                                                      print(
                                                          "Item added to cart");
                                                    } else {
                                                      print(
                                                          "ITEM WAS NOT REMOVED");
                                                    }
                                                  }
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(_scaffoldContext)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Order created!")));
                                                } else {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(_scaffoldContext)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Please add address and number')));
                                                }
                                              },
                                              child: Text(
                                                "Accept",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      const Color(0xFF1BC0C5)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 320.0,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Reject",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 5.0, right: 10.0, bottom: 0.0),
                          child: Text(
                            isCartEmpty ? 'Add Item' : 'Check Out',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
