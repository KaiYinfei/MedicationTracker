import 'package:flutter/material.dart';
import 'medPage.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {

  final medInputController = TextEditingController();
  final timeInputController = TextEditingController();
  final infoInputController = TextEditingController();

  List<String> medList = ['Advil'];
  List<String> timeList = ['M 3:30pm'];
  List<String> infoList = ['Take 2 w/ water'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    medInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Medication'),
          actions: <Widget>[
            FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedPage()),
                  );
                },
                child: Text("View Table"),
                shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: medInputController,
              decoration: InputDecoration(
                hintText: 'Medication Name',
              ),
            ),
            TextField(
              controller: timeInputController,
              decoration: InputDecoration(
                hintText: 'Date and Time',
              ),
            ),
            TextField(
              controller: infoInputController,
              decoration: InputDecoration(
                hintText: 'Additional Information',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          medList.add(medInputController.text);
          timeList.add(timeInputController.text);
          infoList.add(infoInputController.text);
        },
        label: Text('Add Medication'),
    ));
  }

  List<String> getMedList() {
    return medList;
  }

  List<String> getTimeList() {
    return timeList;
  }

  List<String> getInfoList() {
    return infoList;
  }
}