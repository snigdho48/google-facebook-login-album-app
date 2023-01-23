import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveUser(User? user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user', user!.displayName!);
}

void removeUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('user');
}

userStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('user');
}
