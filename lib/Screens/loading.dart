import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.pink[50],
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: Center(
            child: SpinKitRotatingCircle(
          size: 50,
          color: Colors.brown,
        )),
      ),
    );
  }
}
