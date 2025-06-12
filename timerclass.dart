import 'dart:async';

import 'package:bmi_cal/main.dart';
import 'package:flutter/material.dart';

class TimerClass extends StatefulWidget {
  @override
  State<TimerClass> createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: " "),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Text(
            '     BMI\nCalculator',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
