import 'package:flutter/material.dart';
import 'package:aqua_app/page/home.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
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
        primaryColor: const Color.fromRGBO(0, 190, 231, 80), // Set the primary color directly
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(0, 190, 231, 80),
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
    FirebaseMessaging.instance.getToken().then((token){
      print("$token");
    }); 
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
      backgroundColorMenu: const Color.fromRGBO(0, 190, 231, 80),
      slidePercent: 55,
      verticalScalePercent: 90,
      initPositionSelected: 0,
    );
  }
}