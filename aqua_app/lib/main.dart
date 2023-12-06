import 'package:flutter/material.dart';
import 'package:aqua_app/page/home.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HiddenDrawer(), // Use HiddenDrawer as the main screen
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Arial'),
        ),
        primaryColor: Colors.blue, // Set the primary color directly
        appBarTheme: const AppBarTheme(
          color: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  final nameTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: nameTextStyle,
          selectedStyle: nameTextStyle,
        ),
        HomePage(),
      ),
      // Add more screens as needed
      // ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //     name: 'About Us',
      //     baseStyle: nameTextStyle,
      //     selectedStyle: nameTextStyle,
      //   ),
      //   AboutUsPage(),
      // ),
      // ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //     name: 'Search',
      //     baseStyle: nameTextStyle,
      //     selectedStyle: nameTextStyle,
      //   ),
      //   SearchPage(),
      // ),
      // Add more screens as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.blueAccent,
      slidePercent: 55,
      verticalScalePercent: 90,
      initPositionSelected: 0,
    );
  }
}