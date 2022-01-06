import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/Screens/Loading.dart';

import 'package:book_rent_app_chapter3/model/product.dart';
import 'package:book_rent_app_chapter3/provider/app.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';

import 'package:uuid/uuid.dart';
import 'package:book_rent_app_chapter3/services/order.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel? product;
  const ProductDetails({Key? key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldMessengerState>();
  String size = "";
  final OrderServices _orderServices = OrderServices();

  @override
  void initState() {
    super.initState();
    size = widget.product!.sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final BuildContext _scaffoldContext = context;

    return SafeArea(
        child: Scaffold(
          key: _key,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.pink[50],
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          backgroundColor: Colors.pink[50],
          body: ListView(physics: const ScrollPhysics(), children: [
            SizedBox(
              height: 300,
              child: GridTile(
                child: Container(
                    color: Colors.white,
                    child: Carousel(
                      boxFit: BoxFit.cover,
                      images: [
                        Image.network(
                          widget.product!.pictures[0],
                          fit: BoxFit.fill,
                        ),
                        Image.network(
                          widget.product!.pictures[1],
                          fit: BoxFit.fill,
                        ),
                        Image.network(widget.product!.pictures[2]),
                      ],
                      animationCurve: Curves.fastOutSlowIn,
                      dotSize: 4.0,
                      indicatorBgPadding: 4.0,
                    )),
                footer: Container(
                  color: Colors.white70,
                  child: const ListTile(
                    title: Center(
                      child: Text(''
                        //widget.product.name
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                      value: size,
                      style: const TextStyle(color: Colors.white),
                      items: widget.product!.sizes
                          .map<DropdownMenuItem<String>>(
                              (value) =>
                              DropdownMenuItem(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                        color: Colors.red,
                                      ))))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          size = value!;
                        });
                      }),
                ),
                Expanded(child: prodPrice()),
              ],
            ),
            Row(children: [
              TextButton(
                  onPressed: () {
                    double pricef = prodPriceM();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: SizedBox(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'You will be charged $pricef upon delivery!',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          var uuid = const Uuid();
                                          String id = uuid.v4();
                                          if (userProvider.userModel.address !=
                                              '' &&
                                              userProvider.userModel.number !=
                                                  '') {
                                            _orderServices.createOrder(
                                                userId: userProvider.user.uid,
                                                id: id,
                                                description: widget.product!
                                                    .name,
                                                status: "ordered",
                                                totalPrice: pricef,
                                                cart: userProvider.userModel
                                                    .cart!);
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(
                                                _scaffoldContext)
                                                .showSnackBar(const SnackBar(
                                                content:
                                                Text("Order created!")));
                                          } else {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(
                                                _scaffoldContext)
                                                .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Please add address and number')));
                                          }
                                        },
                                        child: const Text(
                                          "Accept",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Reject",
                                          style: TextStyle(color: Colors.white),
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
                  child: const Text(
                    'Check Out',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )),
              appProvider.isLoading
                  ? Loading()
                  : IconButton(
                icon: const Icon(Icons.add_shopping_cart_rounded),
                onPressed: () async {
                  appProvider.changeIsLoading();
                  bool success = await userProvider.addToCart(
                      product: widget.product!, size: size);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to Cart!")));
                    userProvider.reloadUserModel();
                    appProvider.changeIsLoading();
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Not added to Cart!")));
                    appProvider.changeIsLoading();
                    return;
                  }
                  // appProvider.changeIsLoading();
                },
                color: Colors.red,
              ),
              IconButton(
                icon: const Icon(Icons.favorite_rounded),
                onPressed: () async {
                  appProvider.changeIsLoading();
                  bool success =
                  await userProvider.addToFav(product: widget.product!);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to Fav!")));
                    userProvider.reloadUserModel();
                    appProvider.changeIsLoading();
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Not added to Fav!")));
                    appProvider.changeIsLoading();
                    return;
                  }
                },
                color: Colors.red,
              ),
            ]),
            const Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const Divider(),
                Text(widget.product!.description),
                const Divider(),
                const Text('Why you should read?',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const Divider(),
                Text(widget.product!.whyToRead),
                const Divider(),
                const Text(
                  'Similar Books',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Divider(),
              ],
            )
          ]),
        ));
  }

  prodPrice() {
    switch (size) {
      case '1 week':
        return Text(
          'Price: ${widget.product!.prices[0]}',
          style: const TextStyle(color: Colors.black, fontSize: 18),
        );
        break;
      case '2 weeks':
        return Text(
          'Price: ${widget.product!.prices[1]}',
          style: const TextStyle(color: Colors.black, fontSize: 18),
        );
        break;
      case '3 weeks':
        return Text(
          'Price: ${widget.product!.prices[2]}',
          style: const TextStyle(color: Colors.black, fontSize: 18),
        );
        break;
      case '4 weeks':
        return Text(
          'Price: ${widget.product!.prices[3]}',
          style: const TextStyle(color: Colors.black, fontSize: 18),
        );
        break;
      default:
        return const Text('select a time');
    }
  }

  prodPriceM() {
    switch (size) {
      case '1 week':
        return widget.product!.prices[0];
      case '2 weeks':
        return widget.product!.prices[1];
      case '3 weeks':
        return widget.product!.prices[2];
      case '4 weeks':
        return widget.product!.prices[3];
      default:
        return 0;
    }
  }
}
