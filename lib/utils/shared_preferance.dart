import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('user', true);
}

void removeUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('user', false);
}

userStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('user') ?? false;
}
