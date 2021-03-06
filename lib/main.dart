import 'package:TamilSangam/screens/commitee.dart';
import 'package:TamilSangam/screens/contactus.dart';
import 'package:TamilSangam/screens/events.dart';
import 'package:TamilSangam/screens/gallery.dart';
import 'package:TamilSangam/screens/membershipPage.dart';
import 'package:TamilSangam/screens/particularCommiteeList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// screens
import 'package:TamilSangam/screens/onboarding.dart';
import 'package:TamilSangam/screens/aboutus.dart';
import 'package:TamilSangam/screens/pro.dart';
import 'package:TamilSangam/screens/home.dart';
import 'package:TamilSangam/screens/profile.dart';
import 'package:TamilSangam/screens/register.dart';
import 'package:TamilSangam/screens/articles.dart';
import 'package:TamilSangam/screens/elements.dart';

import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _buildDarkTheme(),
        title: 'Tamil sangam Flutter',
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/": (BuildContext context) => new Login(),
          "/home": (BuildContext context) => new Home(),
          "/commitee": (BuildContext context) => new Commitee(),
          "/commiteeList": (BuildContext context) => new CommiteeList(),
          "/events": (BuildContext context) => new Events(),
          "/gallery": (BuildContext context) => new Gallery(),
          "/membership": (BuildContext context) => new Membership(),
          "/contactus": (BuildContext context) => new Contactus(),
          "/profile": (BuildContext context) => new Profile(),
          "/aboutus": (BuildContext context) => new Aboutus(),
          "/articles": (BuildContext context) => new Articles(),
          "/elements": (BuildContext context) => new Elements(),
          "/account": (BuildContext context) => new Register(),
          "/pro": (BuildContext context) => new Pro(),
        });
  }

  ThemeData _buildDarkTheme() {
    final baseTheme = ThemeData(
      fontFamily: "OpenSans",
    );
    return baseTheme.copyWith(
      brightness: Brightness.dark,
      // primaryColor: Color(0xFF143642),
      primaryColor: Color(0xFFE91E63),
      primaryColorLight: Color(0xFF26667d),
      // primaryColorLight: Color(0xFFE91E63),
      // primaryColorDark: Color(0xFF08161b),
      primaryColorDark: Color(0xFFE91E63),
      primaryColorBrightness: Brightness.dark,
      accentColor: Colors.white,
    );
  }
}
