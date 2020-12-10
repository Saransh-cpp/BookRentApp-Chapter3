import 'package:flutter/material.dart';
import 'package:test_app/Widgets.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                        color: Colors.blueAccent,
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
                          )
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
                  shadowColor: Colors.blueAccent,
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

              backgroundColor: Colors.blueAccent,
              body: Container(
                color: Colors.blueAccent,

                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Container(
                          decoration: BoxDecoration(

                              border: Border.all(
                                color: Colors.redAccent,
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.redAccent
                          ),


                        height: 550,
                        width: 400,
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
                                  radius: 50.0,

                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Container(
                                  color: Colors.blueGrey,
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
                            Row(
                              children: [
                                SizedBox(
                                  width: 50.0,
                                ),
                                FlatButton.icon(

                                  onPressed: () {},
                                  color: Colors.redAccent,

                                  icon: Icon(
                                    Icons.edit_rounded,

                                  ),
                                  label: Text(
                                    'EditProfile'
                                  ),



                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                FlatButton.icon(
                                  onPressed: () {},
                                  color: Colors.redAccent,
                                  height: 30.0,
                                  icon: Icon(
                                    Icons.book,
                                  ),
                                  label: Text(
                                    'WishList'
                                  ),
                                )
                              ],
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
