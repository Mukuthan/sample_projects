import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataTablePageMirror extends StatefulWidget {
  const DataTablePageMirror({super.key});
  @override
  _DataTablePageMirrorState createState() => _DataTablePageMirrorState();
}

class _DataTablePageMirrorState extends State<DataTablePageMirror> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _lotCode = TextEditingController();
  final TextEditingController _lotName = TextEditingController();
  final TextEditingController _draw = TextEditingController();
  final TextEditingController _set = TextEditingController();
  final TextEditingController _total = TextEditingController();
  final List<Map<String, dynamic>> rows = [];
  List<Map<String, dynamic>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = rows;
  }

  int id = 0;
  String time = '';
  final formatedTime = DateFormat("yyyy-MM-dd").format(DateTime.now());

  currentTime() {
    time = formatedTime;
    return time.toString();
  }

  void _addRow() {
    id = id + 1;
    _idController.text = id.toString();
    setState(() {
      rows.add({
        "S.no": (_idController.text),
        "Lot Code": _lotCode.text,
        "Lot Name": _lotName.text,
        "Draw": _draw.text,
        "Date": currentTime(),
        "Set": _set.text,
        "Total": int.parse(_total.text)
      });
      _filteredData = rows;
      _clearController();
    });
  }

  void _updateRow(int id) {
    setState(() {
      final index = rows.indexWhere((element) => element["S.no"] == id);
      if (index != -1) {
        rows[index] = {
          "Lot Code": _lotCode.text,
          "Lot Name": _lotName.text,
          "Draw": _draw.text,
          "Set": _set.text,
          "Total": int.parse(_total.text)
        };
      }
      _filteredData = rows;
      _clearController();
    });
  }

  void _deleteRow(int id) {
    setState(() {
      rows.removeWhere((element) => element["S.no"] == id);
      _filteredData = rows;
    });
  }

  void _populateControllers(Map<String, dynamic> row) {
    _lotCode.text = row["Lot Code"];
    _lotName.text = row["Lot Name"];
    _draw.text = row["Draw"];
    _set.text = row["Set"];
    _total.text = row["Total"].toString();
  }

  void _clearController() {
    _lotName.clear();
    _lotCode.clear();
    _draw.clear();
    _set.clear();
    _total.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table Example'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 10.0,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Card(
                elevation: 10.0,
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(width: 5.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Column(
                    children: [
                      const Divider(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Text("Lot Code"),
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("lot_code"),
                              ),
                              controller: _lotCode,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const Text("Lot Name"),
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("lot_name"),
                              ),
                              controller: _lotName,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Text("Draw"),
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("draw"),
                              ),
                              controller: _draw,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const Text("Draw Date"),
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: Text(currentTime()),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Text("Set"),
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("set"),
                              ),
                              controller: _set,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const Text("Total"),
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("total"),
                              ),
                              controller: _total,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                    border: Border.all(width: 4.0),
                    borderRadius: BorderRadius.circular(5.0)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: <Widget>[
                        DataTable(
                            columns: const [
                              DataColumn(
                                label: Text('S.no'),
                              ),
                              DataColumn(
                                label: Text('Lot_Code'),
                              ),
                              DataColumn(
                                label: Text('Lot_Name'),
                              ),
                              DataColumn(
                                label: Text('Draw'),
                              ),
                              DataColumn(
                                label: Text('DrawDate'),
                              ),
                              DataColumn(
                                label: Text('Set'),
                              ),
                              DataColumn(
                                label: Text('Total'),
                              ),
                              DataColumn(label: Text("Edit"))
                            ],
                            rows: _filteredData.map((item) {
                              return DataRow(cells: [
                                DataCell(Text(item["S.no"].toString())),
                                DataCell(Text(item["Lot Code"])),
                                DataCell(Text(item["Lot Name"])),
                                DataCell(Text(item["Draw"])),
                                DataCell(Text(item["Date"])),
                                DataCell(Text(item["Set"])),
                                DataCell(Text(item["Total"].toString())),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _populateControllers(item);
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          _deleteRow(item["S.no"]);
                                        },
                                        icon: const Icon(Icons.delete))
                                  ],
                                ))
                              ]);
                            }).toList()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_lotCode.text.isNotEmpty &&
              _lotName.text.isNotEmpty &&
              _draw.text.isNotEmpty &&
              _set.text.isNotEmpty &&
              _total.text.isNotEmpty) {
            final id = int.parse(_idController.text);
            if (rows.any((element) => element["S.no"] == id)) {
              _updateRow(id);
            } else {
              _addRow();
            }
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
