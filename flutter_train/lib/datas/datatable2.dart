import 'package:flutter/material.dart';

class DataTableCRUDPage extends StatefulWidget {
  const DataTableCRUDPage({super.key});
  @override
  _DataTableCRUDPageState createState() => _DataTableCRUDPageState();
}

class _DataTableCRUDPageState extends State<DataTableCRUDPage> {
  final List<Map<String, dynamic>> _data = [];
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
  }

  void _addRow() {
    setState(() {
      _data.add({
        "id": int.parse(_idController.text),
        "name": _nameController.text,
        "price": double.parse(_priceController.text),
      });
      _filteredData = _data;
      _clearControllers();
    });
  }

  void _updateRow(int id) {
    setState(() {
      final index = _data.indexWhere((element) => element["id"] == id);
      if (index != -1) {
        _data[index] = {
          "id": int.parse(_idController.text),
          "name": _nameController.text,
          "price": double.parse(_priceController.text),
        };
      }
      _filteredData = _data;
      _clearControllers();
    });
  }

  void _deleteRow(int id) {
    setState(() {
      _data.removeWhere((element) => element["id"] == id);
      _filteredData = _data;
    });
  }

  void _clearControllers() {
    _idController.clear();
    _nameController.clear();
    _priceController.clear();
  }

  void _populateControllers(Map<String, dynamic> row) {
    _idController.text = row["id"].toString();
    _nameController.text = row["name"];
    _priceController.text = row["price"].toString();
  }

  void _filterData() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredData = _data;
      } else {
        _filteredData = _data.where((item) {
          return item["name"]
              .toString()
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataTable with CRUD and Search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
            ),
            ElevatedButton(
              onPressed: _addRow,
              child: const Text('Add Row'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _filterData,
                  ),
                ),
              ),
            ),
            DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('Actions')),
              ],
              rows: _filteredData.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item["id"].toString())),
                  DataCell(Text(item["name"])),
                  DataCell(Text(item["price"].toString())),
                  DataCell(Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _populateControllers(item);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteRow(item["id"]);
                        },
                      ),
                    ],
                  )),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_idController.text.isNotEmpty &&
              _nameController.text.isNotEmpty &&
              _priceController.text.isNotEmpty) {
            final id = int.parse(_idController.text);
            if (_data.any((element) => element["id"] == id)) {
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
