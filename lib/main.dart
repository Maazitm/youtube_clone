import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:youtube/firebase_options.dart';
import 'package:youtube/screens/shortsScreen.dart';
import 'package:youtube/screens/splashScreen.dart';
import 'package:youtube/screens/videoPlayerScreen.dart';

void main() async {
  //to ensure the flutter framework is fully initialized
  WidgetsFlutterBinding.ensureInitialized();

  //  Start Firebase using the automatic platform options
  //  Check if Firebase is already initialized
  if (Firebase.apps.isEmpty) {
    // 2. If empty, initialize it
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase just initialized!");
  } else {
    // 3. If not empty, skip initialization
    print("Firebase was already initialized.");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/videoPlayerScreen': (context) => Videoplayerscreen(),
        '/shortsScreen': (context) => ShortsScreen(),
      },
    );
  }
}
