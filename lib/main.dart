import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 12, 14, 36),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 6, 8, 26),
          shadowColor: Color.fromARGB(255, 0, 0, 0),
          elevation: 5,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
