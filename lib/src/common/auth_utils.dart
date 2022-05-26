import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthUtils {
  static final AuthUtils instance = AuthUtils._getInstance();

  AuthUtils._getInstance();

  Future<UserCredential> loginGoogle() async {
    Completer<UserCredential> completer = Completer();

    try {

      await GoogleSignIn().signOut();

      final googleSignIn = await GoogleSignIn().signIn();

      final googleAuth = await googleSignIn!.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signOut();

        var userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        completer.complete(userCredential);
      }
    } on Exception catch (e) {
      completer.completeError(e);
      print("error$e");
    }
    return completer.future;
  }

  Future<UserCredential> loginFacebook() async {
    Completer<UserCredential> completer = Completer();
    try {
      await FirebaseAuth.instance.signOut();
      await FacebookAuth.instance.logOut();
      LoginResult loginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      completer.complete(userCredential);
    } on Exception catch (e) {
      completer.completeError(e);
      print("error$e");
    }
    return completer.future;
  }


}
