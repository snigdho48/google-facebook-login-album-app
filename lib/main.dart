import 'package:demo_intern/pages/Home_Page.dart';
import 'package:demo_intern/pages/Launcher_Page.dart';
import 'package:demo_intern/providers/User_Provider.dart';
import 'package:demo_intern/utils/shared_preferance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secure Ambit',
      initialRoute: Launcher.routeName,
      routes: {
        Launcher.routeName: (_) => const Launcher(),
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
