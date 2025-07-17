import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 0;
  void click(){
    setState(() {
      num++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application",style: TextStyle(color: Colors.indigo)),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello everybody..."),
                  Text(num.toString()),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    click();
                    num = num;
                    print(num);
                  }, child: Text("Cilck me"),
                  ),
                  TextButton(onPressed: (){
                    setState(() {
                      num = 0;
                    });
                  }, child: Text("Reset")),
                ],
              )
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (Context) => Page1()));
      },
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.pages,color: Colors.black,),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
        backgroundColor: Colors.lightGreen,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit)),label: "Freeze"),
        BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: Icon(Icons.access_time_filled_sharp)),label: "Clock"),
      ]),
    );
  }
}
