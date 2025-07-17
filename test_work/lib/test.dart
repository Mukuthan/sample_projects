import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz3GOa09_CQMYmfIdDYXaBzmcVTpSuvTeSpQ&s",
                height: 100,
                width: double.infinity,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "UserName",
                  border: OutlineInputBorder(),
                ),
                onChanged: (input) {
                  print("${input}");
                },
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                onChanged: (input) {
                  print("${input}");
                },
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 40),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: Text("Login"),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container(height: 1.2, color: Colors.black)),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 30, color: Colors.black54),
                  ),
                  Expanded(child: Container(height: 1.2, color: Colors.black)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/facebook.jpg"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login with Facebook",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
