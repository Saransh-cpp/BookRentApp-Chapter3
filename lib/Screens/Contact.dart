import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
          "Contact Us",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        color: Colors.pink[50],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Card(
                elevation: 1,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Do you have an issue, or do you want a new functionality, or are you looking for some random answers? Contact us here -',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClickableCard(
                    textContent: 'Fork our github repository',
                    color: Colors.green,
                    onTap: () async {
                      await _launchURL(
                          'https://github.com/Saransh-cpp/BookRentApp-Chapter3');
                    },
                  ),
                  ClickableCard(
                    textContent: 'Suggest some feature',
                    color: Colors.purple[300],
                    onTap: () async {
                      await _launchURL(
                          'https://github.com/Saransh-cpp/BookRentApp-Chapter3/issues');
                    },
                  ),
                  ClickableCard(
                    textContent: 'Contact owner on Github',
                    color: Colors.blueGrey,
                    onTap: () async {
                      await _launchURL('https://github.com/Saransh-cpp');
                    },
                  ),
                  ClickableCard(
                    textContent: 'Contact owner on LinkedIn',
                    color: Colors.lightBlue,
                    onTap: () async {
                      await _launchURL(
                          'https://www.linkedin.com/in/saransh-cpp/');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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

class ClickableCard extends StatelessWidget {
  ClickableCard(
      {@required this.textContent, @required this.onTap, @required this.color});
  final String textContent;
  final Function onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      elevation: 10,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.pink.withAlpha(60),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              textContent,
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
