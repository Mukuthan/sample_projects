import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataTablePage1 extends StatefulWidget {
  const DataTablePage1({super.key});
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage1> {
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
  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    final DateTime now = DateTime.now();
    final DateFormat formateDate = DateFormat('yyyy-MM-dd');
    setState(() {
      time = formateDate.format(now);
    });
  }

  void _addRow() {
    int? numRow = int.tryParse(_controller.text);
    if ((numRow ?? 0) > numrow) {
      numrow = numRow!;
    }
    setState(() {
      for (int i = 1; i <= numrow; i++) {
        id = id + 1;
        rows.add(
          DataRow(cells: [
            DataCell(Text('$id')),
            DataCell(TextField(
              decoration: const InputDecoration(hintText: "LotCode"),
              controller: _lotCode,
            )),
            DataCell(TextField(
              decoration: const InputDecoration(
                hintText: "LotName",
              ),
              controller: _lotName,
            )),
            DataCell(TextField(
              decoration: const InputDecoration(
                hintText: "Draw",
              ),
              controller: _draw,
            )),
            DataCell(Text(time)),
            DataCell(TextField(
              decoration: const InputDecoration(hintText: "Set"),
              controller: _set,
            )),
            DataCell(TextField(
              decoration: const InputDecoration(hintText: "Total"),
              controller: _total,
            )),
          ]),
        );
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
