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
<<<<<<< HEAD:lib/Screens/Loading.dart
      home: SafeArea(
        child: Container(
          child: Center(
              child: SpinKitPouringHourGlass(
            size: 50,
            color: Colors.brown,
          )),
        ),
=======
      home: const SafeArea(
        child: Center(
            child: SpinKitRotatingCircle(
          size: 50,
          color: Colors.brown,
        )),
>>>>>>> 58a58d2146bc80c17af2e109833ba7b0eb7e2a72:lib/Screens/loading.dart
      ),
    );
  }
}
