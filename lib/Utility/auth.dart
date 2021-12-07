import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<User> googleSignIn();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User> googleSignIn() async {
    print('starting');
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    print('works 1');
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    print('works 2');
    final GoogleSignInAuthentication googleAuth =
    await googleAccount.authentication;
    print('works 3');
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    print('works 4');
    try{
      UserCredential result = await _firebaseAuth.signInWithCredential(credential);
      print('works 5');
      if(result == null){
        print('result null');
        return null;
      }else{
        User user = result.user;
        print('works right');
        return user;
      }
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}