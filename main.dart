import 'package:bmi_cal/resultPage.dart';
import 'package:bmi_cal/timerclass.dart';
import 'package:flutter/material.dart';
// import 'dart:core';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: TimerClass(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result ;
  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.light,
                    decoration: InputDecoration(
                        label: const Text('Enter Weight(kg)'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.deepPurple))),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: const Text('Enter feet'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.deepPurple))),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextField(
                    controller: inchController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: const Text('Enter inches'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.deepPurple))),
                  ),
                  const SizedBox(
                    height: 13,
                  ),

                  SizedBox(
                    width: 320,
                    child: FilledButton(
                        onPressed: () {
                          var wt = wtController.text.toString();
                          var ft = ftController.text.toString();
                          var inch = inchController.text.toString();

                          if (wt != '' && ft != '' && inch != '') {
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iInch = int.parse(inch);

                            var totalInches = (ift * 12) + iInch;
                            var totalM = (totalInches * 2.54) / 100;

                            var bmi = iwt / (totalM * totalM);
                            var msg = "";

                            if(bmi<18.5){
                              msg="Under Weight";

                            } else if(bmi>18.5 && bmi<24.9){
                              msg="Normal weight";
                            } else if(bmi>25 && bmi<29.9){
                              msg="Over Weight";
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      resultPage(result),
                                ));

                            setState(() {
                              result =
                                  'Your BMI: ${bmi.toStringAsFixed(2)} \n  $msg';
                            });
                          } else {
                            setState(() {
                              result = "Please fill all blank fields!!";
                            });
                          }
                        },
                        child: Text('Calculate')),
                  ),
                  const SizedBox(
                    height: 13,
                  ),

                  // Text(
                  //   'controller: result',
                  // )
                ],
              ),
            ),
          ),
        ));
  }
}
