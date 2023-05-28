import 'package:flutter/material.dart';
import 'package:our_gazipur/screens/bottom_nav_screen/home_screen.dart';
import 'package:our_gazipur/screens/main_screens/main_screen.dart';
import 'package:our_gazipur/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gazipur city',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

