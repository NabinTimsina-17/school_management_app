import 'package:flutter/material.dart';
import 'package:school_management_app/home_screen.dart';
import 'package:school_management_app/splash_screen.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management System App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}