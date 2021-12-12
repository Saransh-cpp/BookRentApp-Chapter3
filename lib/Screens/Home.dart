//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/QuizScreens/Question1.dart';
//import 'package:test_app/Screens/LoginPage.dart';
import 'package:test_app/Screens/orders.dart';
import 'package:test_app/Screens/product_search.dart';
import 'package:test_app/Widgets.dart';
//import 'package:test_app/database.dart';
//import 'package:test_app/Screens/Register.dart';
import 'package:test_app/provider/product.dart';
import 'package:test_app/provider/user.dart';
//import 'package:test_app/services/product.dart';
import 'package:test_app/Screens/Favourites.dart';
import 'package:test_app/Screens/Profile.dart';
//import 'package:test_app/Screens/Quiz.dart';
import 'package:test_app/Screens/Recommendations.dart';
import 'package:test_app/Screens/BestSellers.dart';
import 'package:test_app/Screens/AboutUs.dart';
import 'package:test_app/Screens/Contact.dart';
import 'package:test_app/Screens/Report.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return SafeArea(
        child: Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: InkWell(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent,
                ])),
                accountName: Text(
                  userProvider.userModel?.name ?? "username loading...",
                ),
                accountEmail: Text(
                  userProvider.userModel?.email ?? "email loading...",
                ),
              ),
              Container(
                height: 600,
                color: Colors.pink[50],
                child: Column(
                  children: [
                    CustomListTile(
                        Icons.person,
                        'Profile',
                        () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => UpdateProfile()))
                            }),
                    CustomListTile(
                        Icons.favorite_outlined,
                        'Favourites',
                        () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => Favourites()))
                            }),
                    ListTile(
                      leading: Icon(
                        Icons.bookmark_border_rounded,
                        color: Colors.black,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                      title: Text(
                        'My Orders',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () async {
                        await userProvider.getOrders();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => OrdersScreen()));
                      },
                    ),
                    CustomListTile(
                        Icons.contact_support_rounded,
                        'Contact us',
                        () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => ContactUs()))
                            }),
                    CustomListTile(
                        Icons.home,
                        'About',
                        () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (c) => AboutUs()))
                            }),
                    CustomListTile(
                        Icons.error,
                        'Report issue',
                        () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (c) => Report()))
                            }),
                    CustomListTile(Icons.logout, 'Logout', () {
                      userProvider.signOut();
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            },
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.pink[50],
          elevation: 0.0,
          title: Text(
            'Chapter 3',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: []),
      backgroundColor: Colors.pink[50],
      body: Stack(children: [
        ListView(
          children: [
            // Search(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        await productProvider.search(productName: pattern);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => ProductSearchScreen()));
                      },
                      decoration: InputDecoration(
                        hintText: "Search your books here!",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.pink[50],
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  Center(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.pink[50],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[200]),
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.97,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.pink[900],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Colors.pink[50]),
                                    height: 100.0,
                                    width: 350.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            'Welcome ${userProvider.userModel.name}! \nLet us pick a book for you!'
                                            // userProvider.userModel.bio
                                            )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              InkWell(
                                splashColor: Colors.greenAccent,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => Question1()));
                                },
                                child: Container(
                                  height: 100,
                                  width: 350,
                                  child: Center(
                                    child: Text('Quiz'),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.pink[900],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              InkWell(
                                splashColor: Colors.greenAccent,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => Recommendations()));
                                },
                                child: Container(
                                  height: 100,
                                  child: Center(
                                    child: Text('Recommendations'),
                                  ),
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.pink[900],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Ink(
                                color: Colors.blueAccent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => BestSellers()));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 350,
                                    child: Center(
                                      child: Text('Best Sellers'),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.pink[900],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                              )
                            ],
                          ))),
                ],
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
