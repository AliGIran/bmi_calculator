import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
      home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  double _weight = 0, _height = 0;

  double _bmi = 0;

  Color get _resultColor {
    if (_bmi < 18.5) {
      return Colors.blue;
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return Colors.green;
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return Colors.yellow;
    } else if (_bmi >= 30 && _bmi <= 39.9) {
      return Colors.orange;
    } else if (_bmi >= 40) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  _bmi.toStringAsFixed(1),
                  style: TextStyle(
                      color: _resultColor,
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(hintText: "Weight in Kg"),
                onChanged: (text) {
                  _weight = double.parse(text);
                },
              ),
            ), //weight
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(hintText: "Height in meter"),
                onChanged: (text) {
                  _height = double.parse(text);
                },
              ),
            ), //height

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bmi = _weight / pow(_height, 2);
                    });
                  },
                  child: const Text("Calculate")),
            )
          ],
        ),
      ),
    );
  }
}
