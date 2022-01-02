import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/provider/app.dart';
import 'package:test_app/provider/user.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  final _key = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return SafeArea(
          child: Scaffold(
          key: _key,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 1,
            title: Text(
              "Favourites",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          backgroundColor: Colors.white,
          body: appProvider.isLoading
              ? Loading()
              : ListView.builder(
                  itemCount: userProvider.userModel.fav.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.red.withOpacity(0.2),
                                  offset: Offset(3, 2),
                                  blurRadius: 30)
                            ]),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                child: Image.network(
                                  userProvider.userModel.fav[index].image,
                                  height: 120,
                                  width: 140,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: userProvider
                                                    .userModel.fav[index].name +
                                                "\n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                "\$${userProvider.userModel.fav[index].price} \n\n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300)),
                                      ]),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          appProvider.changeIsLoading();
                                          bool success =
                                              await userProvider.removeFromFav(
                                                  favItem: userProvider
                                                      .userModel.fav[index]);
                                          if (success) {
                                            userProvider.reloadUserModel();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Removed from fav!")));
                                            appProvider.changeIsLoading();
                                            return;
                                          } else {
                                            appProvider.changeIsLoading();
                                          }
                                        })
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ));
  }
}
