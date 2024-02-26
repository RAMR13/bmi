import 'package:bmi/content.dart';
import 'package:flutter/material.dart';
import 'consts.dart';
import 'recard.dart';

TextStyle restyle =
    TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold);

class ResultScreen extends StatelessWidget {
  final String bmi;
  final String uptext;
  const ResultScreen({super.key, required this.bmi, required this.uptext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      backgroundColor: Color.fromARGB(255, 12, 14, 36),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: restyle,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Consts.kActive,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      uptext,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(bmi,
                        style: TextStyle(
                            fontSize: 75,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold)),
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: ReCard(
                  ontaps: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  c: Color.fromARGB(255, 201, 30, 55),
                  cardChild: Center(
                    child: Text(
                      'RE-CALCULATE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
