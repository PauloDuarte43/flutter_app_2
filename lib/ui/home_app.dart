import 'dart:math';

import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App 2',
      home: MyHome(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<MyHome> {
  Random randomNum = new Random();
  int _contadorGrana = 0;
  int _tmpGrana;
  MaterialColor _corGrana = Colors.red;

  void _maisGrana() {
    _tmpGrana = randomNum.nextInt(1000);

    if (randomNum.nextInt(3) % 2 != 0) {
      _tmpGrana = _tmpGrana * -1;
    }

    _contadorGrana = _contadorGrana + _tmpGrana;

    if (_contadorGrana <= 0) {
      _corGrana = Colors.red;
    } else if (_contadorGrana > 0 && _contadorGrana <= 9999) {
      _corGrana = Colors.green;
    } else {
      _corGrana = Colors.amber;
    }

    setState(() {
      _contadorGrana = _contadorGrana;
    });
  }

  void _zeraGrana() {
    setState(() {
      _contadorGrana = 0;
      _corGrana = Colors.red;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Magnata"),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Center(
              child: Text(
            "Fique Rico!",
            style: TextStyle(fontSize: 30.0),
          )),
          Expanded(
              child: Center(
                  child: Text("\$ $_contadorGrana",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: _corGrana,
                          fontWeight: FontWeight.w700)))),
          Expanded(
            child: Center(
              child: FlatButton(
                onPressed: _maisGrana,
                child: Text(
                  "Mais Grana!!",
                  style: TextStyle(fontSize: 19.5),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: FlatButton(
                onPressed: _zeraGrana,
                child: Text(
                  "Mais Grana!!",
                  style: TextStyle(fontSize: 19.5),
                ),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ),
          )
        ],
      )),
    );
  }
}
