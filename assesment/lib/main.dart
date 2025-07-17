import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "User Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}
