import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultPage extends StatelessWidget {
  @override
  var namefromhome;
  resultPage(this.namefromhome);

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: Container(
        color: Colors.deepPurple,
          child: Center(
              child: Text(
                  "$namefromhome", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800, color: Colors.white),))),
    );
  }
}
