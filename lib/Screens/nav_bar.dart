import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/Screens/your_orders.dart';
import 'package:book_rent_app_chapter3/Screens/all_books.dart';
import 'package:book_rent_app_chapter3/Screens/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PageController pageController = PageController();
  int currentIndex = 0;
  var currentTab = [
    const Home(),
    const AllBooks(),
    const YourOrders(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          children: currentTab,
          controller: pageController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
            height: 60.0,
            backgroundColor: Colors.pink[50]!,
            items: const <Widget>[
              Icon(Icons.home_rounded, size: 30),
              Icon(Icons.menu_book_rounded, size: 30),
              Icon(Icons.shopping_cart_rounded, size: 30),
            ],
            index: currentIndex,
            animationCurve: Curves.easeInToLinear,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (int index) {
              setState(() {
                currentIndex = index;
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              });
            }),
      ),
    );
  }
}
