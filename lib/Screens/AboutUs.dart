import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final double spacing = 40;
  List jsonContributors = [];
  String _about_this_app =
      "BookRentApp application is specifically made for renting books.It displays collections of top selling books as well as the option to have your taste curated and matched with a book.Here customers can filter and select books based on genre, after which placing immediate or deferred orders with the option to cancel.";

  Future<void> _fetchContributors() async {
    const contributorsAPIUrl =
        'https://api.github.com/repos/Saransh-cpp/BookRentApp-Chapter3/contributors';

    //final response = await http.get(Uri(host: contributorsAPIUrl));
    final response = await http.get(Uri.parse(contributorsAPIUrl));

    if (response.statusCode == 200) {
      setState(() {
        //jsonContributors = json.decode(response.body) as List; //original
        jsonContributors = jsonDecode(response.body) as List;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Failed to load Contributors from API",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchContributors();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const SpinKitRotatingCircle(
              color: Colors.blue,
            )
          : SafeArea(
              child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            "ABOUT",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: const Text(
                              "BOOK-RENT-APP",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                // color: Colors.orange[900],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Card(
                        elevation: 1,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(_about_this_app),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        "Presenting The Team",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    _buildTeamTitle('AUTHOR'),
                    Container(
                      height: 190,
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: devTeam.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: <Widget>[
                              _buildprofileImage(devTeam[index]["imgPath"]),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      devTeam[index]["name"],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 5)),
                                    Row(
                                      children: <Widget>[
                                        _buildProfileIcon(
                                            devTeam[index]["linkedin"],
                                            'https://img.icons8.com/fluent/48/000000/linkedin-circled.png'),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        _buildProfileIcon(
                                            devTeam[index]["github"],
                                            'https://img.icons8.com/fluent/50/000000/github.png'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _buildTeamTitle('CONTIBUTORS'),
                    // ignore: prefer_is_empty
                    if (jsonContributors.length > 0)
                      Container(
                        height: 170,
                        margin: const EdgeInsets.only(top: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: jsonContributors.length,
                          itemBuilder: (BuildContext context, int index) =>
                              (jsonContributors[index]["login"].toString() ==
                                      "Saransh-cpp")
                                  ? Container()
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Column(
                                        children: <Widget>[
                                          _buildNetworkprofileImage(
                                              jsonContributors[index]
                                                      ["avatar_url"]
                                                  .toString()),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  jsonContributors[index]
                                                          ["login"]
                                                      .toString(),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5)),
                                                Row(
                                                  children: <Widget>[
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10)),
                                                    _buildProfileIcon(
                                                        jsonContributors[index]
                                                                ["html_url"]
                                                            .toString(),
                                                        'https://img.icons8.com/fluent/50/000000/github.png'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                        ),
                      )
                    else
                      const Center(child: CircularProgressIndicator()),
                    //////////////
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Made with ❤ by Open Source",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
    );
  }

  Widget _buildprofileImage(String imagePath) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        boxShadow: _buildBoxShadow,
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: _buildBoxShadow,
            color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
              //image: AssetImage('images/pranav.jpg'),
              image: NetworkImage(
                  'https://avatars.githubusercontent.com/u/74055102?v=4'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNetworkprofileImage(String imagePath) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        boxShadow: _buildBoxShadow,
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: _buildBoxShadow,
            color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
              //image: AssetImage('images/pranav.jpg'),
              image: NetworkImage(imagePath), // original
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildProfileIcon(String link, String iconUrl) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        boxShadow: _buildBoxShadow,
        shape: BoxShape.circle,
      ),
      child: RawMaterialButton(
        shape: const CircleBorder(),
        elevation: 10,
        onPressed: () async {
          await _launchURL(link);
        },
        child: SizedBox(
          width: 100,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(iconUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BoxShadow> get _buildBoxShadow => [
        BoxShadow(
          offset: const Offset(0.00, 3.00),
          color: const Color(0xff000000).withOpacity(0.16),
          blurRadius: 6,
        ),
      ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}

List<Map<String, String>> devTeam = [
  {
    "imgPath": 'assets/images/team/smaranjit_ghose.png',
    "name": "Saransh",
    "linkedin": "https://www.linkedin.com/in/saransh-cpp/",
    "github": "https://github.com/Saransh-cpp",
  },
];
