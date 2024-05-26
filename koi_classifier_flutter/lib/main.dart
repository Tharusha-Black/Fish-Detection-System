import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'profile_page.dart';
import 'history_page.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'enter_page.dart';
import 'main_page.dart';
import 'library_page.dart';
import 'term.dart';
import 'privacy.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koily',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route to '/'
      routes: {
        '/e': (context) => EnterPage(), // Map '/' route to EnterPage
        '/login': (context) => LoginPage(), // Add login route
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/': (context) => HistoryPage(),
        '/about': (context) => AboutUsPage(),
        '/contact': (context) => ContactUsPage(),
        '/main_page': (context) => MainPage(),
        '/library': (context) => LibraryPage(), 
        '/tnc': (context) => TermsAndConditionsPage(),
        '/pvc': (context) => PrivacyPolicyPage(),

      },
    );
  }
}
