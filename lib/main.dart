import 'package:flutter/material.dart';
import 'package:petersfinal/Login.dart';
import 'package:petersfinal/aboutpage.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peters Mobile Application',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // Navigation routes from Login.dart
      initialRoute: '/', 
      routes: {
        '/': (context) => LoginPage(), 
        '/about': (context) => AboutPage(), 
      },
    );
  }
}
