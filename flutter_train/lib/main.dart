import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() => runApp(const MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
