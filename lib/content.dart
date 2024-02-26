import 'package:bmi/brain.dart';
import 'package:bmi/resultScreen.dart';
import 'package:flutter/material.dart';
import 'child.dart';
import 'recard.dart';

enum Gender {
  male,
  female,
}

int weight = 60;
int age = 25;
const TextStyle BBW =
    TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold);
const TextStyle BBL =
    TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.bold);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 100;
  static const active = Color.fromARGB(255, 36, 36, 64);
  static const inactive = Color.fromARGB(255, 17, 17, 44);
  Gender? selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(),
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        child: ReCard(
                      ontaps: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      c: selectedgender == Gender.male ? active : inactive,
                      cardChild: cardchild(
                        ico: Icons.male,
                        gen: 'MALE',
                      ),
                    )),
                    Expanded(
                        child: ReCard(
                      ontaps: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      c: selectedgender == Gender.female ? active : inactive,
                      cardChild: cardchild(gen: 'FEMALE', ico: Icons.female),
                    )),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: ReCard(
                      c: active,
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: BBL,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: BBW,
                              ),
                              Text(
                                'CM',
                                style: BBL,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                trackHeight: 1.5,
                                activeTrackColor:
                                    Color.fromARGB(255, 220, 220, 220),
                                inactiveTrackColor:
                                    Color.fromARGB(255, 80, 80, 80),
                                thumbColor: Color.fromARGB(255, 226, 36, 64),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayColor: Color.fromARGB(62, 223, 37, 65)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 100,
                              max: 220,
                              onChanged: (value) {
                                setState(() {
                                  height = value.round();
                                });
                              },
                            ),
                          )
                        ],
                      ))),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        child: ReCard(
                      c: active,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: BBL,
                          ),
                          Text(
                            weight.toString(),
                            style: BBW,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleButton(
                                ico: Icons.add,
                                fn: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              CircleButton(
                                ico: Icons.remove,
                                fn: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                    Expanded(
                      child: ReCard(
                        c: active,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: BBL,
                            ),
                            Text(
                              age.toString(),
                              style: BBW,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleButton(
                                  ico: Icons.add,
                                  fn: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                CircleButton(
                                  ico: Icons.remove,
                                  fn: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ReCard(
                ontaps: () {
                  Brain hdmi = new Brain(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                bmi: hdmi.bmicalc(),
                                uptext: hdmi.getres(),
                              )));
                },
                c: Color.fromARGB(255, 201, 30, 55),
                cardChild: Center(
                  child: Text(
                    'CALCULATE',
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
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData ico;
  final VoidCallback fn;
  const CircleButton({super.key, required this.ico, required this.fn});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: Color.fromARGB(81, 255, 255, 255),
      child: Icon(
        ico,
        color: Colors.white,
      ),
      onPressed: fn,
      onLongPress: fn,
    );
  }
}
