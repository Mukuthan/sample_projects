import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataTablePage extends StatefulWidget {
  const DataTablePage({super.key});
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _lotCode = TextEditingController();
  final TextEditingController _lotName = TextEditingController();
  final TextEditingController _draw = TextEditingController();
  final TextEditingController _set = TextEditingController();
  final TextEditingController _total = TextEditingController();
  final List<DataRow> rows = [];
  int numrow = 1;
  int id = 0;
  String time = '';
  final formatedTime = DateFormat("yyyy-MM-dd").format(DateTime.now());

  currentTime() {
    time = formatedTime;
    return time;
  }

  void _addRow() {
    int? numRow = int.tryParse(_controller.text);
    setState(() {
      if ((numRow ?? 0) > numrow) {
        numrow = numRow!;
      }
      if (_lotCode.text.isNotEmpty &&
          _lotName.text.isNotEmpty &&
          _draw.text.isNotEmpty &&
          _set.text.isNotEmpty &&
          _total.text.isNotEmpty) {
        for (int i = 1; i <= numrow; i++) {
          id = id + 1;
          rows.add(
            DataRow(cells: [
              DataCell(Text('$id')),
              DataCell(Text(_lotCode.text)),
              DataCell(Text(_lotName.text)),
              DataCell(Text(_draw.text)),
              DataCell(Text(currentTime())),
              DataCell(Text(_set.text)),
              DataCell(Text(_total.text)),
              DataCell(IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    rows.removeAt(i - 1);
                  });
                },
              )),
            ]),
          );
        }
      }
    });
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Text("No.Rows"),
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("rows"),
                              ),
                              keyboardType: TextInputType.number,
                              controller: _controller,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: _addRow,
                        child: const Text('Add Row'),
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
                          rows: rows,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
