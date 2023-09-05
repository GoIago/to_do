import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent)); // To set overlay color
    return MaterialApp(
      debugShowCheckedModeBanner: false, // To stop debug message
      title: 'ToDo App',
      home: Home(), // To call 'home' page
    );
  }
}
