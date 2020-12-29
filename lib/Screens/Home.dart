import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/LoginPage.dart';
import 'package:test_app/Screens/orders.dart';
import 'package:test_app/Screens/product_search.dart';
import 'package:test_app/Widgets.dart';
import 'package:test_app/config/config.dart';
import 'package:test_app/database.dart';
import 'package:test_app/Screens/Register.dart';
import 'package:test_app/provider/product.dart';
import 'package:test_app/provider/user.dart';
import 'package:test_app/services/product.dart';
import 'package:test_app/Screens/Favourites.dart';
import 'package:test_app/Screens/Profile.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _key = GlobalKey<ScaffoldState>();
  ProductServices _productServices = ProductServices();

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
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.deepOrange,
                                Colors.orangeAccent,
                              ]
                            )
                          ),
                          accountName: Text(
                            userProvider.userModel?.name ?? "username loading...",
                          ),
                          accountEmail: Text(
                            userProvider.userModel?.email ?? "email loading...",
                          ),
                          currentAccountPicture: CircleAvatar(
                            /*backgroundImage: NetworkImage(
                              BookApp.sharedPreferences.getString(BookApp.userPhotoUrl)
                            ),*/
                            radius: 30,
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
                                  Navigator.push(context, MaterialPageRoute(builder: (c) => UpdateProfile()))
                                    }
                              ),
                            CustomListTile(
                                Icons.favorite_outlined,
                                'Favourites',
                                    () => {
                                  Navigator.push(context, MaterialPageRoute(builder: (c) => Favourites()))
                                    }
                            ),
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
                              onTap: () async{
                                await userProvider.getOrders();
                                Navigator.push(context, MaterialPageRoute(builder: (c) => OrdersScreen()));
                              },
                            ),
                            CustomListTile(
                                Icons.settings,
                                'Settings',
                                    () => {}
                            ),
                            CustomListTile(
                                Icons.home,
                                'About',
                                    () => {}
                            ),
                            CustomListTile(
                                Icons.error,
                                'Report issue',
                                    () => {}
                            ),
                            CustomListTile(
                                Icons.logout,
                                'Logout',
                              () {
                                  userProvider.signOut();
                                  //_auth.signOut();
                                 /*BookApp.auth.signOut().then((c) {
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => LoginPage()));*/
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
                      icon: Icon(Icons.menu,color: Colors.black,),
                      onPressed: (){
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
                    actions: [
                      // IconButton(
                      //     icon: Icon(
                      //         Icons.search_rounded,
                      //         color: Colors.black,
                      //     ),
                      //     onPressed:() {
                      //       showSearch(context: context, delegate: DataSearch());
                      //     },
                      // ),
                    ]
                ),

                backgroundColor: Colors.pink[50],
                body: Stack(
                  children: [
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
                                onSubmitted: (pattern)async{
                                  await productProvider.search(productName: pattern);
                                  Navigator.push(context, MaterialPageRoute(builder: (c) => ProductSearchScreen()));
                                },
                                decoration: InputDecoration(
                                  hintText: "blazer, dress...",
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
                          SizedBox(
                            height: 30.0,
                          ),
                          Center(
                            child: Container(
                                decoration: BoxDecoration(

                                    border: Border.all(
                                      color: Colors.pink[50],
                                    ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: Colors.pink[900]
                                ),


                              height: MediaQuery.of(context).size.height*0.7,
                              width: MediaQuery.of(context).size.width*0.97,
                              child: Column(

                                children: [
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(

                                    children: [
                                      SizedBox(
                                        width: 30.0,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.pink[50],
                                        radius: 50.0,
                                      ),
                                      SizedBox(
                                        width: 35.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(

                                            border: Border.all(
                                              color: Colors.pink[900],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                            color: Colors.pink[50]
                                        ),


                                        height: 100.0,
                                        width: 200.0,
                                        child: Column(
                                          children: [
                                            Text(''
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
                                    onTap: () {},
                                    //Photo by Daniel Schludi on Unsplash
                                    child: Container(

                                      height: 100,
                                      width: 350,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(

                                            image: AssetImage(
                                                'images/daniel-schludi-7JL7NdhaRd8-unsplash.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.pink[900],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),

                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  InkWell(
                                    splashColor: Colors.greenAccent,
                                    onTap: () {},
                                    //Photo by Daniel Schludi on Unsplash
                                    child: Container(

                                      height: 100,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(

                                            image: AssetImage(
                                                'images/daniel-schludi-7JL7NdhaRd8-unsplash.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.pink[900],
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),

                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Ink(
                                    color: Colors.blueAccent,
                                    child: InkWell(

                                      onTap: () {},
                                      //Photo by Daniel Schludi on Unsplash
                                      child: Container(

                                        height: 100,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(

                                              image: AssetImage(
                                                  'images/daniel-schludi-7JL7NdhaRd8-unsplash.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.pink[900],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),

                                      ),
                                    ),
                                  )
                                ],
                              )

                            )
                          ),
                      ],
                      ),
                      )
                    ],
                  ),
          ]
                ),
              )
          );
  }
}

class DataSearch extends StatefulWidget {
  @override
  _DataSearchState createState() => _DataSearchState();
}

class _DataSearchState extends State<DataSearch> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return ListTile(
      leading: Icon(
        Icons.search,
        color: Colors.black,
      ),
      title: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (pattern)async{
          await productProvider.search(productName: pattern);
          Navigator.push(context, MaterialPageRoute(builder: (c) => ProductSearchScreen()));
          },
        decoration: InputDecoration(
          hintText: "blazer, dress...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}


// class DataSearch extends SearchDelegate<String>{
//
//   final cities = [
//     "The Alchemist",
//     "dsgd",
//     "afs",
//     "afsa"
//   ];
//
//   final recentCities = [
//     "afs",
//     "afsa"
//
//   ];
//
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // actions for app bar
//     return[
//       IconButton(
//         icon: Icon(
//           Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     // leading icon
//     return
//       IconButton(
//         icon: AnimatedIcon(
//             icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//             ),
//         onPressed: () {
//           close(context, null);
//         },
//       );
//
//
//   }
//
//   @override
//   // ignore: missing_return
//   Widget buildResults(BuildContext context) {
//     // results
//     return Card(
//       color: Colors.redAccent,
//       shape: StadiumBorder(),
//       child: Center(
//         child: Text(query),
//       ),
//     );
//   }
//
//   @override
//   // ignore: missing_return
//   Widget buildSuggestions(BuildContext context) {
//     // suggestions
//
//     final suggestionList = query.isEmpty ? recentCities
//         : cities.where((p) => p.startsWith(query)).toList();
//
//     return ListView.builder(
//         itemBuilder: (context, index) => ListTile(
//           onTap: (){
//             showResults(context);
//           },
//           leading: Icon(Icons.menu_book_outlined),
//           title: RichText(
//             text: TextSpan(
//               text: suggestionList[index].substring(0, query.length),
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold
//               ),
//               children: [
//                 TextSpan(
//                   text: suggestionList[index].substring(query.length),
//                   style: TextStyle(
//                     color: Colors.grey
//                   )
//                 )
//               ]
//             ),
//           ),
//         ),
//       itemCount: suggestionList.length,
//     );
//
//   }
//
// }
