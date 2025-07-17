import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        drawer: AppBar(title: Text('Pugazh')),
        appBar: AppBar(
          backgroundColor: Colors.black,

          actions: [
            Text('About   ', style: TextStyle(color: Colors.blue)),
            Text('  Home', style: TextStyle(color: Colors.blue)),
            Text('  Contact', style: TextStyle(color: Colors.blue)),
          ],
        ),
        body: Center(),
      ),
    );
  }
}
