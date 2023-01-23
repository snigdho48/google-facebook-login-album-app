import 'package:demo_intern/utils/shared_preferance.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/User_Provider.dart';

class Launcher extends StatefulWidget {
  static const routeName = '/launcher';
  const Launcher({Key? key}) : super(key: key);

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  void initState() {
    userStatus().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Album APP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Login to continue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () async {
                        await provider.googleLogin().then((value) {
                          if (value) {
                            print(value);
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.googlePlusG),
                              Spacer(),
                              Text('Google+'),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () async =>
                          await provider.signInWithFacebook().then((value) {
                        if (value) {
                          print(value);
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      }),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.facebookF),
                              Spacer(),
                              Text('Facebook'),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
