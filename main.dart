import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Tracker',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MedPage(title: 'Medication Tracker'),
    );
  }
}

class MedPage extends StatefulWidget {
  MedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MedPageState createState() => _MedPageState();
}

class _MedPageState extends State<MedPage> {
  var _medArr = new List();
  final _medInputController = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Enter Medication Here'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _medInputController,
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _medArr.add(_medInputController.text);
          return showDialog(
            context: context,
            builder: (context) {
          return AlertDialog(
            content: Text(_medInputController.text + ' has been added to your list'),
              );
            },
          );
        },
        tooltip: 'Add Medication',
        child: Icon(Icons.add),
      ));
  }
}

