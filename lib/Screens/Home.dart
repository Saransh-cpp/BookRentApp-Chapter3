import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/LoginPage.dart';
import 'package:test_app/Widgets.dart';
import 'package:test_app/database.dart';
import 'package:test_app/Screens/Register.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink[50]
      ),
      debugShowCheckedModeBanner: false,
      //home: StreamProvider<QuerySnapshot>.value(
        home: Scaffold(
          backgroundColor: Colors.pink[50],
          body: SafeArea(
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
                          accountName: Text('Saransh'),
                          accountEmail: Text('saransh0701@gmail.com'),
                          currentAccountPicture: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        Container(
                          height: 1000,
                          color: Colors.pink[50],
                          child: Column(
                          children: [
                            CustomListTile(
                                  Icons.person,
                                  'Profile',
                                      () => {}
                              ),
                            CustomListTile(
                                Icons.person,
                                'Profile',
                                    () => {}
                            ),
                            CustomListTile(
                                Icons.person,
                                'Profile',
                                    () => {}
                            ),
                            CustomListTile(
                                Icons.person,
                                'Profile',
                                    () => {}
                            ),
                            CustomListTile(
                                Icons.logout,
                                'Logout',
                              () {
                                  //_auth.signOut();
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30)
                      )
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                          ),
                          onPressed:() {
                            showSearch(context: context, delegate: DataSearch());
                          },
                      ),
                    ]
                ),

                backgroundColor: Colors.pink[50],
                body: Container(
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
                                        Text(
                                          "User Info here"
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

                        ),
                      ),
                  ],
                  ),
                ),
              )

          ),
        ),
      );
  }
}

class DataSearch extends SearchDelegate<String>{

  final cities = [
    "The Alchemist",
    "dsgd",
    "afs",
    "afsa"
  ];

  final recentCities = [
    "afs",
    "afsa"

  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return[
      IconButton(
        icon: Icon(
          Icons.clear),
        onPressed: () {
          query = "";
        },
      )

    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon
    return
      IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
            ),
        onPressed: () {
          close(context, null);
        },
      );


  }

  @override
  // ignore: missing_return
  Widget buildResults(BuildContext context) {
    // results
    return Card(
      color: Colors.redAccent,
      shape: StadiumBorder(),
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  // ignore: missing_return
  Widget buildSuggestions(BuildContext context) {
    // suggestions

    final suggestionList = query.isEmpty ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.menu_book_outlined),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey
                  )
                )
              ]
            ),
          ),
        ),
      itemCount: suggestionList.length,
    );

  }

}
