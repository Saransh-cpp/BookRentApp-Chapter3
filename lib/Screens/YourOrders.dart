import 'package:flutter/material.dart';
import 'package:test_app/Widgets.dart';

class YourOrders extends StatefulWidget {
  @override
  _YourOrdersState createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.pink[50],
          body: CartProducts(),
          bottomNavigationBar: Container(
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                        'Total:'
                    ),
                    subtitle: Text(
                        'Rs 50'
                    ),
                  ),
                ),

                Expanded(
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: () {},
                    child: Text(
                      'Rent',
                      style: TextStyle(
                          color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),),
      ),
    );
  }
}
