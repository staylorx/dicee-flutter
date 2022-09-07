import 'dart:math';

import 'package:flutter/material.dart';

//because we only have six images
const int sideCount = 6;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDieNumber = 1;
  int rightDieNumber = 1;
  Random random = Random(DateTime.now().millisecondsSinceEpoch);

  randomDieRoll() {
    return random.nextInt(sideCount) + 1;
  }

  void changeDieFace() {
    setState(() {
      leftDieNumber = randomDieRoll();
      rightDieNumber = randomDieRoll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDieFace();
              },
              child: Image.asset('images/dice$leftDieNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDieFace();
              },
              child: Image.asset('images/dice$rightDieNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
