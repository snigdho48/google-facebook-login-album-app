import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../providers/User_Provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(user?.displayName != null ? user!.displayName! : ''),
        actions: [
          IconButton(
              onPressed: () async => await provider.logOut().then((value) =>
                  Navigator.pushReplacementNamed(context, '/launcher')),
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
