import 'package:flutter/material.dart';
import 'package:flutter_train/datas/datatable.dart';
import 'package:flutter_train/datas/datatable1.dart';
import 'package:flutter_train/datas/excelPage.dart';
import 'package:flutter_train/datas/datatable2.dart';
import 'package:flutter_train/pract.dart';
import 'package:flutter_train/pract1.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
        backgroundColor: Colors.orangeAccent,
        flexibleSpace: const SafeArea(child: Icon(Icons.camera)),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      drawer: const Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("User E-mail.id"),
              decoration: BoxDecoration(color: Colors.orangeAccent),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text("Image"),
              ),
            ),
            ListTile(
              title: Text("Lottery Info"),
              leading: Icon(Icons.info),
            ),
            Divider(
              height: 0.55,
            ),
            ListTile(
              title: Text("Events"),
              leading: Icon(Icons.event),
            ),
            Divider(
              height: 0.55,
            ),
            ListTile(
              title: Text("Lottery News"),
              leading: Icon(Icons.newspaper),
            ),
            Divider(
              height: 0.55,
            ),
            ListTile(
              title: Text("Recent Winning Numbers"),
              leading: Icon(Icons.numbers),
            ),
            Divider(
              height: 0.55,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStBKJ6UV3eYs1VRd8bmQmkLrSzY_lWIq0sORccHtDNe_uk_lTi0ww-bpvUvMssJn52fiU&usqp=CAU.jpg'),
              fit: BoxFit.fill),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DataTablePage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      persistentFooterButtons: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DataTableCRUDPage()));
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.yellowAccent)),
            child: const Icon(Icons.scanner)),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DataTablePage1()));
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)),
            child: const Icon(Icons.clear_all)),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ExcelPage()));
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.lightGreen)),
            child: const Icon(Icons.ac_unit))
      ],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(label: "Save", icon: Icon(Icons.save_alt)),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DataTablePage2()));
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DataTablePageMirror()));
          }
        },
      ),
    );
  }
}
