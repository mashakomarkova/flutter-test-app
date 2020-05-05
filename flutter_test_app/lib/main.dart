import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final int numberRange = 254;
  Color changingColor = Colors.blue;
  String mainText = 'Hey there';
  double fontSize = 40.0;

  int generateRandomColor() {
    return Random().nextInt(numberRange) + 1;
  }
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            backgroundColor: changingColor,
            body: Stack(children: <Widget>[
              Center(
                child: Text(mainText, style: TextStyle(fontSize: fontSize)),
              ),
              Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (e) {
                  setState(() {
                    changingColor = Color.fromRGBO(
                        generateRandomColor(),
                        generateRandomColor(),
                        generateRandomColor(),
                        1);
                  });
                },
              )
            ])));
  }
}
