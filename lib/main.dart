import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:youtube/screens/shortsScreen.dart';
import 'package:youtube/screens/testScreen.dart';
import 'package:youtube/screens/videoPlayerScreen.dart';

void main() {
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
        '/': (context) => Testscreen(),
        '/videoPlayerScreen': (context) => Videoplayerscreen(),
        '/shortsScreen': (context) => ShortsScreen(),
      },
    );
  }
}
