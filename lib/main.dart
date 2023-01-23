import 'package:demo_intern/providers/User_Provider.dart';
import 'package:demo_intern/screens/Deatils_page.dart';
import 'package:demo_intern/screens/Home_Page.dart';
import 'package:demo_intern/screens/Launcher_Page.dart';
import 'package:demo_intern/utils/shared_preferance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade700.withOpacity(.5),
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        brightness: Brightness.dark,
        hintColor: Colors.white,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
        primaryIconTheme: const IconThemeData(color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Secure Ambit',
      initialRoute:
          userStatus() == null ? Launcher.routeName : HomePage.routeName,
      routes: {
        Launcher.routeName: (_) => const Launcher(),
        HomePage.routeName: (_) => const HomePage(),
        DetailsPage.routeName: (_) => const DetailsPage(),
      },
    );
  }
}
