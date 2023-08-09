import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/QuizScreens/question1.dart';
import 'package:book_rent_app_chapter3/Screens/orders.dart';
import 'package:book_rent_app_chapter3/Screens/product_search.dart';
import 'package:book_rent_app_chapter3/provider/product.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';
import 'package:book_rent_app_chapter3/Screens/favourites.dart';
import 'package:book_rent_app_chapter3/Screens/profile.dart';
import 'package:book_rent_app_chapter3/Screens/recommendations.dart';
import 'package:book_rent_app_chapter3/Screens/best_sellers.dart';
import 'package:book_rent_app_chapter3/Screens/about_us.dart';
import 'package:book_rent_app_chapter3/Screens/contact.dart';
import 'package:wiredash/wiredash.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _createHeader(String username, String email) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('images/drawer-back.png'))),
        child: Center(
          child: Stack(children: <Widget>[
            Positioned(
              bottom: 30.0,
              left: 16.0,
              child: Center(
                child: Text(
                  username,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontFamily: 'MontBold'),
                ),
              ),
            ),
            Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Center(
                  child: Text(email,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'Mont'))),
            ),
          ]),
        ));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          IconTheme(
            data: IconThemeData(color: Colors.grey[600]),
            child: Icon(icon),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

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
              _createHeader(
                userProvider.userModel.name,
                userProvider.userModel.email,
              ),
              _createDrawerItem(
                  icon: Icons.person,
                  text: 'Profile',
                  onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => const UpdateProfile()))
                      }),
              _createDrawerItem(
                  icon: Icons.favorite_outlined,
                  text: 'Favourites',
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const Favourites()))
                      }),
              _createDrawerItem(
                  icon: Icons.bookmark_border_rounded,
                  text: 'My Orders',
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const OrdersScreen()))
                      }),
              _createDrawerItem(
                  icon: Icons.contact_support_rounded,
                  text: 'Contact us',
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const ContactUs()))
                      }),
              _createDrawerItem(
                  icon: Icons.home,
                  text: 'About',
                  onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => const AboutUs()))
                      }),
              _createDrawerItem(
                  icon: Icons.error,
                  text: 'Report issue',
                  onTap: () => {Wiredash.of(context)?.show()}),
              _createDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {
                    userProvider.signOut();
                  }),
            ],
          ),
        ),
      ),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _drawerKey.currentState!.openDrawer();
            },
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.pink[50],
          elevation: 0.0,
          title: const Text(
            'Chapter 3',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: const []),
      backgroundColor: Colors.pink[50],
      body: Stack(children: [
        ListView(
          children: [
            // Search(),
            Container(
              decoration: const BoxDecoration(
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
                    leading: const Icon(
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
                                builder: (c) => const ProductSearchScreen()));
                      },
                      decoration: const InputDecoration(
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
                                color: Colors.pink[50]!,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[200]),
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.97,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.pink[900]!,
                                        ),
                                        borderRadius: const BorderRadius.all(
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
                              const SizedBox(
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
                                  child: const Center(
                                    child: Text('Quiz'),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.pink[900]!,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              InkWell(
                                splashColor: Colors.greenAccent,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) =>
                                              const Recommendations()));
                                },
                                child: Container(
                                  height: 100,
                                  child: const Center(
                                    child: Text('Recommendations'),
                                  ),
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.pink[900]!,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Ink(
                                color: Colors.blueAccent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) =>
                                                const BestSellers()));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 350,
                                    child: const Center(
                                      child: Text('Best Sellers'),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.pink[900]!,
                                        ),
                                        borderRadius: const BorderRadius.all(
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
