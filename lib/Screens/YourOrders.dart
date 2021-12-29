import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/Loading.dart';
import 'package:book_rent_app_chapter3/Screens/product_details.dart';

import 'package:book_rent_app_chapter3/model/cart_item.dart';
import 'package:book_rent_app_chapter3/provider/app.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';
import 'package:book_rent_app_chapter3/services/order.dart';
import 'package:uuid/uuid.dart';

// const String testDevice = 'ca-app-pub-2019702807519064~1210594994';

class YourOrders extends StatefulWidget {
  @override
  _YourOrdersState createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
    contentUrl: 'https://flutter.io',
    childDirected: true,
    keywords: <String>['books', 'library', 'novels'],
  );

  final _key = GlobalKey<ScaffoldMessengerState>();
  OrderServices _orderServices = OrderServices();
  ProductDetails productDetails = ProductDetails();
  BannerAd? _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-2019702807519064/7611340051',
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print('Banner event : $event');
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-2019702807519064~1210594994');
    // showBannerAd();
    _bannerAd = createBannerAd()
      ..load()
      ..show(anchorOffset: 125);
  }

  @override
  void dispose() {
    _bannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          key: _key,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 1,
            title: Text(
              "Shopping Cart",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          backgroundColor: Colors.white,
          body: appProvider.isLoading
              ? Loading()
              : ListView.builder(
                  itemCount: userProvider.userModel.cart!.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.red.withOpacity(0.2),
                                  offset: Offset(3, 2),
                                  blurRadius: 30)
                            ]),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                child: Image.network(
                                  userProvider.userModel.cart![index].image,
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
                                                    .cart![index].name +
                                                "\n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                "\$${userProvider.userModel.cart![index].price} \n\n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300)),
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
                                            _key.currentState!.showSnackBar(
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
                  }),
          bottomNavigationBar: Container(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: TextButton(
                        onPressed: () {
                          if (userProvider.userModel.totalCartPrice == 0) {
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Your cart is empty',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
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
                                                      _key.currentState!
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "Removed from Cart!")));
                                                    } else {
                                                      print(
                                                          "ITEM WAS NOT REMOVED");
                                                    }
                                                  }
                                                  _key.currentState!
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Order created!")));
                                                  Navigator.pop(context);
                                                } else {
                                                  _key.currentState!
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
                                          ) //}
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text(
                          'Check Out',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        )),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
