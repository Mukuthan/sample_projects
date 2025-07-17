import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() =>
    runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> post = [];
  bool loading = true;

  Future<void> fetcher() async {
    final request = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
    );
    if (request.statusCode == 200) {
      setState(() {
        post = json.decode(request.body);
        loading = false;
      });
    } else {
      print("Error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetcher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar"), backgroundColor: Colors.amber),
      body:
          loading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: post.length,
                itemBuilder: (context, index) {
                  final resource = post[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        resource['title'],
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(resource['body']),
                    ),
                  );
                },
              ),
    );
  }
}
