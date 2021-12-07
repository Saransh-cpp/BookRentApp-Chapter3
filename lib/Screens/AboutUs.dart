import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
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
  String _aboutThisApp =
      "Chapter3 is an app specifically made for renting books. It displays collections of top-selling books as well as the option to have your taste curated and matched with a book. Here customers can filter and select books based on genre, after which placing immediate or deferred orders with the option to cancel.";

  Future<void> _fetchContributors() async {
    const contributorsAPIUrl =
        'https://api.github.com/repos/Saransh-cpp/BookRentApp-Chapter3/contributors';

    final response = await http.get(Uri.parse(contributorsAPIUrl));

    if (response.statusCode == 200) {
      setState(() {
        jsonContributors = jsonDecode(response.body) as List;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Failed to load contributors.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchContributors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.pink,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "About",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                child: const Text(
                  "Chapter 3",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(_aboutThisApp, textAlign: TextAlign.center),
                  ),
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
                  itemBuilder: (BuildContext context, int index) => Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: <Widget>[
                        _buildProfileImage(devTeam[index]["imgPath"]),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                devTeam[index]["name"],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              Row(
                                children: <Widget>[
                                  _buildProfileIcon(devTeam[index]["linkedin"],
                                      'https://img.icons8.com/fluent/48/000000/linkedin-circled.png'),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  _buildProfileIcon(devTeam[index]["github"],
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
                                    "Saransh-cpp" ||
                                jsonContributors[index]["login"].toString() ==
                                    "allcontributors[bot]")
                            ? Container()
                            : Container(
                                margin:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  children: <Widget>[
                                    _buildNetworkProfileImage(
                                        jsonContributors[index]["avatar_url"]
                                            .toString()),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            jsonContributors[index]["login"]
                                                .toString(),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 5)),
                                          Row(
                                            children: <Widget>[
                                              const Padding(
                                                  padding: EdgeInsets.only(
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

  Widget _buildProfileImage(String imagePath) {
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
              image: NetworkImage(
                  'https://avatars.githubusercontent.com/u/74055102?v=4'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNetworkProfileImage(String imagePath) {
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
              image: NetworkImage(imagePath),
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Something went wrong!',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.grey[700],
        behavior: SnackBarBehavior.floating,
      ));
      throw 'Could not launch $url';
    }
  }
}

List<Map<String, String>> devTeam = [
  {
    "name": "Saransh",
    //"linkedin": "https://www.linkedin.com/in/saransh-cpp/",// original link
    "linkedin":
        "htt://www.linkedin.com/in/saransh-cpp/", // link that can't be fetched , to see the functionality of snackBar
    "github": "https://github.com/Saransh-cpp",
  },
];
