import 'package:flutter/material.dart';
import 'inputPage.dart';

class MedPage extends StatefulWidget {
  MedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MedPageState createState() => _MedPageState();
}

class _MedPageState extends State<MedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Medication Table'),
        ),
        body: TableWidget(),
        );
  }
}
  class TableWidget extends StatelessWidget {
    TableWidget({Key key}): super(key: key);

    InputPageState medCellList = new InputPageState();

 @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Medication',
            style: TextStyle(fontStyle: FontStyle.italic),
          )
        ),
        DataColumn(
          label: Text(
            'Time',
            style: TextStyle(fontStyle: FontStyle.italic),
          )
        ),
        DataColumn(
          label: Text(
            'Additional Info',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        5,
          (index) => DataRow(
            cells: [
              DataCell(Text(medCellList.getMedList().first)),
              DataCell(Text(medCellList.getTimeList().first)),
              DataCell(Text(medCellList.getInfoList().first)),
            ],
          ),
      ),
    );
  }
}