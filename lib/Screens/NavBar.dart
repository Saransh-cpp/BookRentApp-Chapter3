import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:book_rent_app_chapter3/Screens/YourOrders.dart';
import 'package:book_rent_app_chapter3/Screens/AllBooks.dart';
import 'package:book_rent_app_chapter3/Screens/Home.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PageController pageController = PageController();
  int currentIndex = 0;
  var currentTab = [
    Home(),
    AllBooks(),
    YourOrders(),
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
            items: <Widget>[
              Icon(Icons.home_rounded, size: 30),
              Icon(Icons.menu_book_rounded, size: 30),
              Icon(Icons.shopping_cart_rounded, size: 30),
            ],
            index: currentIndex,
            animationCurve: Curves.easeInToLinear,
            animationDuration: Duration(milliseconds: 500),
            onTap: (int index) {
              setState(() {
                currentIndex = index;
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              });
            }),
      ),
    );
  }
}
