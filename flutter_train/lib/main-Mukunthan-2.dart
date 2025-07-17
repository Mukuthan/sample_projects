import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.camera_outlined,
            color: Colors.black,
            size: 40.0,
          ),
        ),
      ),
      drawer: const Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Mukunthan E.S"),
              accountEmail: Text("mukunthanelangovan354gmail.com"),
              decoration: BoxDecoration(color: Colors.blueAccent),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text("Image"),
              ),
            ),
            ListTile(
              title: Text("Sent"),
              leading: Icon(Icons.send_outlined),
            ),
            Divider(
              height: 30.0,
            ),
            ListTile(
              title: Text("Recived"),
              leading: Icon(Icons.receipt),
            ),
            Divider(
              height: 30.0,
            ),
            ListTile(
              title: Text("All Mails"),
              leading: Icon(Icons.people),
            ),
            Divider(
              height: 30.0,
            ),
            ListTile(
              title: Text("Forwarded"),
              leading: Icon(Icons.inbox),
            ),
            Divider(
              height: 30.0,
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "App Body",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      persistentFooterButtons: <Widget>[
        ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)),
            child: const Icon(Icons.save_alt)),
        ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.yellowAccent)),
            child: const Icon(Icons.scanner)),
      ],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.save_alt), label: "Download"),
        ],
        onTap: (int index) {
          print(index.toString());
        },
      ),
    );
  }
}
