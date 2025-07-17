import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataTablePage2 extends StatefulWidget {
  const DataTablePage2({super.key});
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage2> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _lotCode = TextEditingController();
  final List<TextEditingController> _lotCode1 = [];
  final TextEditingController _lotName = TextEditingController();
  final List<TextEditingController> _lotName1 = [];
  final TextEditingController _draw = TextEditingController();
  final List<TextEditingController> _draw1 = [];
  final TextEditingController _set = TextEditingController();
  final List<TextEditingController> _set1 = [];
  final TextEditingController _total = TextEditingController();
  final List<TextEditingController> _total1 = [];
  final TextEditingController _remove = TextEditingController();
  List<DataRow> rows = [];
  final List<DataRow> data = [];

  int numrow = 1, numrem = 1;
  int id = 0;
  String time = '';
  bool cd = false;
  bool nam = false;
  bool dw = false;
  bool se = false;
  bool tot = false;

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    final DateTime now = DateTime.now();
    final DateFormat formatDate = DateFormat('yyyy-MM-dd');
    setState(() {
      time = formatDate.format(now);
    });
  }

  void _addRow() {
    int? numRow = int.tryParse(_controller.text);
    if ((numRow ?? 0) > numrow) {
      numrow = numRow!;
    }
    setState(() {
      for (int i = 1; i <= numrow; i++) {
        if (cd == true) {
          _lotCode.clear();
        }
        if (nam == true) {
          _lotName.clear();
        }
        if (dw == true) {
          _draw.clear();
        }
        if (se == true) {
          _set.clear();
        }
        if (tot == true) {
          _total.clear();
        }
        id = id + 1;
        data.add(
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
        _lotCode1.add(_lotCode);
        _lotName1.add(_lotName);
        _draw1.add(_draw);
        _set1.add(_set);
        _total1.add(_total);
      }
    });
    rows = data;
  }

  void remove_() {
    int? numRem = int.tryParse(_remove.text);
    if ((numRem ?? 0) > numrem) {
      numrem = numRem!;
    }
    setState(() {
      for (int i = 0; i < numrem; i++) {
        rows.removeLast();
        --id;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _lotCode.dispose();
    _lotName.dispose();
    _draw.dispose();
    _set.dispose();
    _total.dispose();
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
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("No.Rows"),
                              ),
                              keyboardType: TextInputType.number,
                              controller: _controller,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _addRow,
                            child: const Text('Add Row'),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 25.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: ("No.Rows"),
                              ),
                              keyboardType: TextInputType.number,
                              controller: _remove,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: remove_,
                            child: const Text('Remove Row'),
                          ),
                        ],
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
                          columns: [
                            const DataColumn(
                              label: Text('S.no'),
                            ),
                            DataColumn(
                              label: Row(
                                children: [
                                  const Text('Lot Code'),
                                  Checkbox(
                                      value: cd,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          cd = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                            DataColumn(
                              label: Row(
                                children: [
                                  const Text('Lot Name'),
                                  Checkbox(
                                      value: nam,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          nam = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                            DataColumn(
                              label: Row(
                                children: [
                                  const Text('Draw'),
                                  Checkbox(
                                      value: dw,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          dw = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                            const DataColumn(
                              label: Text('DrawDate'),
                            ),
                            DataColumn(
                              label: Row(
                                children: [
                                  const Text('Set'),
                                  Checkbox(
                                      value: se,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          se = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                            DataColumn(
                              label: Row(
                                children: [
                                  const Text('Total'),
                                  Checkbox(
                                      value: tot,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          tot = value!;
                                        });
                                      })
                                ],
                              ),
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
