import 'package:flutter/material.dart';
import 'inputPage.dart';

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
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: loginPage(title: 'Medication Tracker'),
    );
  }
}

class loginPage extends StatefulWidget {
  loginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> { //https://pusher.com/tutorials/login-ui-flutter
  final testPassword = '1234';
  final passController = TextEditingController();

  @override
  void dispose(){
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final passwordField = TextField(
      controller: passController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Password is 1234',
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (passController.text == testPassword) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputPage()),
            );
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
      ),
    ));
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height:255.0,
                  child: Image.asset(
                    "app_icons/medAppLogo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height:5.0),
                Text('Medication Tracker', textAlign: TextAlign.center, textScaleFactor: 2.0,),
                SizedBox(height: 45.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



