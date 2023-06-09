import 'package:example/screens/tp5.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Level2 extends StatefulWidget {
  const Level2({super.key});

  @override
  State<Level2> createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  late List<List<TextEditingController>> sudokuControllors;

  restart() {
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        sudokuControllors[i][j].text = '';
      }
    }
    sudokuControllors[0][0].text = '5';
    sudokuControllors[0][1].text = '6';
    sudokuControllors[1][1].text = '7';
  }

  late List<String> numbers;
  late List<List<Color>> sudokuColor;
  @override
  void initState() {
    sudokuControllors = List.generate(
        9, (_) => List.generate(9, (_) => TextEditingController()));

    restart();
    numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', ''];
    sudokuColor =
        List.generate(9, (_) => List.generate(9, (_) => Colors.black));

    super.initState();
  }

  int doubleToInt(double val) {
    return val.toInt();
  }

  int timerSeconds = 0;
  Timer? timer;

  void startTimer() {
    // Check if a timer is already running, cancel it before starting a new one
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }

    // Start the timer
    timerSeconds = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        timerSeconds++;
      });
    });
  }

  void restartTimer() {
    // Cancel the timer if it is running
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }

    // Reset the timerSeconds value to 0
    setState(() {
      timerSeconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
          title: const Text(
            'Level 2',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: GridView.builder(
              itemCount: 81,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9),
              itemBuilder: (context, i) => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.black,
                        width:
                            (doubleToInt(i / 9) == 2 || doubleToInt(i / 9) == 5)
                                ? 5
                                : 1),
                    right: BorderSide(
                        color: Colors.black,
                        width: (i % 9 == 2 || i % 9 == 5) ? 5 : 1),
                  ),
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value) {
                      if (!numbers.contains(value)) {
                        sudokuControllors[doubleToInt(i / 9)][i % 9].text = '';
                      } else {
                        for (var j = 0; j < 9; j++) {
                          if (sudokuControllors[doubleToInt(i / 9)][j].text ==
                                  value &&
                              j != (i % 9) &&
                              value != '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("something's wrong horizantally"),
                                  backgroundColor: Colors.red),
                            );
                          }
                          if (sudokuControllors[j][i % 9].text == value &&
                              j != (doubleToInt(i / 9)) &&
                              value != '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("something's wrong vertically"),
                                  backgroundColor: Colors.red),
                            );
                          }
                        }
                      }
                    },
                    controller: sudokuControllors[doubleToInt(i / 9)][i % 9],
                    maxLength: 1,
                    style: TextStyle(
                        fontWeight: (sudokuControllors[doubleToInt(i / 9)]
                                        [i % 9]
                                    .text !=
                                "")
                            ? FontWeight.bold
                            : FontWeight.w400,
                        color: sudokuColor[doubleToInt(i / 9)][i % 9]),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    enabled:
                        sudokuControllors[doubleToInt(i / 9)][i % 9].text == "",
                  ),
                ),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                        horizontal: 35.0,
                        vertical: 15.0), // Adjust the padding values here
                  ),
                ),
                child: const Text('Start')),
            ElevatedButton(
                onPressed: () {
                  restart();
                  restartTimer();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                        horizontal: 35.0,
                        vertical: 15.0), // Adjust the padding values here
                  ),
                ),
                child: const Text('Restart')),
          ]),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: startTimer,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 35.0,
                              vertical: 15.0), // Adjust the padding values here
                        ),
                      ),
                      child: const Text('Timer')),
                  Text('$timerSeconds seconds'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const TP5()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.indigo),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                          horizontal: 35.0,
                          vertical: 15.0), // Adjust the padding values here
                    ),
                  ),
                  child: const Text('Return to Level 1')),
            ],
          ),
          const SizedBox(height: 50)
        ]));
  }
}
