import 'package:flutter/material.dart';

class CategoryTable extends StatefulWidget {
  const CategoryTable({super.key});

  @override
  State<CategoryTable> createState() => CategoryTable_State();
}

class CategoryTable_State extends State<CategoryTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('카테고리')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
              ],
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('카테고리')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
              ],
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('카테고리')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
              ],
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('카테고리')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                  DataCell(Text('A1')),
                ]),
              ],
            )
          ],
        ),
      )),
    );
  }
}
