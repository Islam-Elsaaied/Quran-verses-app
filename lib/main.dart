import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(QuranMoodApp());
}

class QuranMoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'آيات للحالات النفسية',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Amiri',
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}