import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Widgets.dart';
import 'package:test_app/model/product.dart';
import 'package:test_app/provider/app.dart';
import 'package:test_app/provider/user.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetails extends StatefulWidget {

  final ProductModel product;
  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();
  String size = "";

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
      ),
      backgroundColor: Colors.pink[50],
      body: ListView(physics: ScrollPhysics(), children: [
        Container(
          height: 300,
          child: GridTile(
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
                )),
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
        ),
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                  value: size,
                  style: TextStyle(color: Colors.white),
                  items: widget.product.sizes
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ))))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      size = value;
                    });
                  }),
            ),
            Expanded(child: ProdPrice()),
          ],
        ),
        Row(children: [
          Expanded(
              child: MaterialButton(
            elevation: 0.0,
            onPressed: () {},
            color: Colors.red,
            textColor: Colors.white,
            child: Text('Buy Now'),
          )),
          appProvider.isLoading
              ? Loading()
              : IconButton(
                  icon: Icon(Icons.add_shopping_cart_rounded),
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
                  color: Colors.red,
                ),
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            onPressed: () async {
              appProvider.changeIsLoading();
              bool success =
                  await userProvider.addToFav(product: widget.product);
              if (success) {
                _key.currentState
                    .showSnackBar(SnackBar(content: Text("Added to Fav!")));
                userProvider.reloadUserModel();
                appProvider.changeIsLoading();
                return;
              } else {
                _key.currentState
                    .showSnackBar(SnackBar(content: Text("Not added to Fav!")));
                appProvider.changeIsLoading();
                return;
              }
              appProvider.changeIsLoading();
            },
            color: Colors.red,
          ),
        ]),
        Divider(),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Divider(),
            Text(widget.product.description),
            Divider(),
            Text('Why you should read?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            Text(widget.product.whyToRead),
            Divider(),
            Text(
              'Similar Books',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Divider(),
            /*Container(
                  height: 360,
                  child: SimilarProducts(),
                )*/
          ],
        )
      ]),
    ));
  }

  ProdPrice() {
    switch(size){
      case '1 week':
        return     Text(
          'Price: ${widget.product.prices[0]}',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18
          ),
        );
        break;
      case '2 weeks':
        return     Text(
          'Price: ${widget.product.prices[1]}',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18
          ),
        );
        break;
      case '3 weeks':
        return     Text(
          'Price: ${widget.product.prices[2]}',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18
          ),
        );
        break;
      case '4 weeks':
        return     Text(
          'Price: ${widget.product.prices[3]}',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18
          ),
        );
        break;
      default:
        return Text(
          'select a time'
        );
    }
  }
}
