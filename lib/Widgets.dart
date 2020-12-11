import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:test_app/Screens/product_details.dart';

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 56 : 200,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.blue[300]),
                    border: InputBorder.none),
              )
                  : null,
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.blue[900],
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        child: InkWell(
          onTap: onTap,
            splashColor: Colors.orangeAccent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(text,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),),
                      ),

                    ],
                  ),
                  Icon(Icons.arrow_right_rounded)
                ]
            )
        ),
      ),
    );
  }
}



class Products extends StatefulWidget {


  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {



  var product_list = [
    {
      "name": "Book 1",
      "picture": "images/IMG_20201210_170910_696.jpg",

    },
    {
      "name": "book 2",
      "picture": "images/IMG_20201210_170758_134.jpg",

    },
    {
      "name": "book 3",
      "picture": "images/IMG_20201210_171229_060.jpg",

    },
    {
      "name": "book 4",
      "picture": "images/IMG_20201210_171229_060.jpg",

    },







  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 400,
        width: 500,
        color: Colors.pink[50],
          child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: product_list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                return Single_prod(
                  prod_name: product_list[index]['name'],
                  prod_pricture: product_list[index]['picture'],

                );
              }),


      ),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;


  Single_prod({
    this.prod_name,
    this.prod_pricture,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ProductDetails())),
              child: GridTile(
                  footer: Container(
                    height: 50,
                    color: Colors.white70,
                    child: ListTile(
                      leading: Container(
                        height: 1000,
                        width: 50,
                        child: Text(
                            prod_name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                        ),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )

              ),
            ),
          )),
    );
  }
}


