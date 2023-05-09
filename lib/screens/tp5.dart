import 'package:example/screens/tp5/level2.dart';
import 'package:flutter/material.dart';

class TP5 extends StatefulWidget {
  const TP5({Key? key});

  @override
  State<TP5> createState() => _TP5State();
}

class _TP5State extends State<TP5> {
  late List<List<TextEditingController>> sudokuControllors;

  restart() {
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        sudokuControllors[i][j].text = '';
      }
    }
    sudokuControllors[0][1].text = '3';
    sudokuControllors[0][3].text = '1';
    sudokuControllors[1][0].text = '1';
    sudokuControllors[1][2].text = '3';
    sudokuControllors[1][3].text = '2';
    sudokuControllors[2][0].text = '3';
    sudokuControllors[3][1].text = '1';
    sudokuControllors[2][2].text = '1';
    sudokuControllors[3][3].text = '3';
  }

  late List<String> numbers;
  late List<List<Color>> sudokuColor;
  @override
  void initState() {
    sudokuControllors = List.generate(
        4, (_) => List.generate(4, (_) => TextEditingController()));

    restart();
    numbers = ['1', '2', '3', '4', ''];
    sudokuColor =
        List.generate(4, (_) => List.generate(4, (_) => Colors.black));

    super.initState();
  }

  int doubleToInt(double val) {
    return val.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigoAccent,
            centerTitle: true,
            title: const Text('Level 1',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white))),
        body: Column(children: [
          Expanded(
              child: GridView.builder(
                  itemCount: 16,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, i) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black,
                                  width: (doubleToInt(i / 4) == 1) ? 5 : 1),
                              right: BorderSide(
                                  color: Colors.black,
                                  width: (i % 4 == 1) ? 5 : 1))),
                      child: Center(
                          child: TextField(
                              onChanged: (value) {
                                if (!numbers.contains(value)) {
                                  sudokuControllors[doubleToInt(i / 4)][i % 4]
                                      .text = '';
                                } else {
                                  for (var j = 0; j < 4; j++) {
                                    if (sudokuControllors[doubleToInt(i / 4)][j]
                                                .text ==
                                            value &&
                                        j != (i % 4) &&
                                        value != '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "something's wrong horizantally"),
                                              backgroundColor: Colors.red));
                                    }
                                    if (sudokuControllors[j][i % 4].text ==
                                            value &&
                                        j != (doubleToInt(i / 4)) &&
                                        value != '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "something's wrong vertically"),
                                              backgroundColor: Colors.red));
                                    }
                                  }
                                }
                              },
                              controller: sudokuControllors[doubleToInt(i / 4)]
                                  [i % 4],
                              maxLength: 1,
                              style: TextStyle(
                                  fontWeight:
                                      (sudokuControllors[doubleToInt(i / 4)]
                                                      [i % 4]
                                                  .text !=
                                              "")
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                  color: sudokuColor[doubleToInt(i / 4)]
                                      [i % 4]),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: '',
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              enabled: sudokuControllors[doubleToInt(i / 4)]
                                          [i % 4]
                                      .text ==
                                  ""))))),
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
                child: const Text('Timer')),
            ElevatedButton(
                onPressed: () {
                  restart();
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
                child: const Text('Restart'))
          ]),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => level2()));
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
              child: const Text('Go to Level 2')),
          const SizedBox(height: 70)
        ]));
  }
}
