import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../utils/shared_preferance.dart';
import 'package:http/http.dart' as http;

User? user;

class UserProvider extends ChangeNotifier {
  Future<bool> googleLogin() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print(googleUser.toString());
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      user = userCredential.user!;
      saveUser(); // save user in shared preference
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithFacebook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile']);
      print(result.message);
      final token = result.accessToken!.token;
      print(
          'Facebook token userID : ${result.accessToken!.grantedPermissions}');
      // print(
      //     'Facebook token userID : ${result.accessToken!.grantedPermissions}');
      // final graphResponse = await http.get(Uri.parse(
      //     'https://graph.facebook.com/'
      //     'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
      //
      // final profile = jsonDecode(graphResponse.body);
      // print("Profile is equal to $profile");

      try {
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(token);
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookCredential);
        user = userCredential.user!;
        return true;
      } catch (e) {
        print(e);
        removeUser();
        notifyListeners();
        return false;
      }
    } catch (e) {
      print(e);
      removeUser();
      notifyListeners();
      return false;
    }
  }

  Future<void> logOut() async {
    // Trigger the sign-out flow
    try {
      removeUser();
      await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      removeUser();
      await GoogleSignIn()
          .signOut()
          .then((value) async => GoogleSignIn().disconnect);
      await FirebaseAuth.instance.signOut();
    }
  }
}
