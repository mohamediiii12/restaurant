// lib/main.dart
import 'package:flutter/material.dart';
import 'package:restaurant/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YumQuick',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Arial',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
