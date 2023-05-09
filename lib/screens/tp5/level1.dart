import 'package:flutter/material.dart';

class level1 extends StatefulWidget {
  const level1({super.key});

  @override
  State<level1> createState() => _level1State();
}

class _level1State extends State<level1> {
  @override
  Widget build(BuildContext context) {
    int doubleToInt(double val) {
      return val.toInt();
    }

    List<List<TextEditingController>> sudokuControllors = List.generate(
        4, (_) => List.generate(4, (_) => TextEditingController()));
    List<List<bool>> sudokuValid =
        List.generate(4, (_) => List.generate(4, (_) => true));
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
    List<String> numbers = ['1', '2', '3', '4', ''];
    List<List<Color>> sudokuColor =
        List.generate(4, (_) => List.generate(4, (_) => Colors.black));
    void changeColorRed(i, j) {
      setState(() {
        sudokuColor[i][j] = Colors.red;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'TP 5',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Timer button
              ElevatedButton(
                onPressed: () {
                  // Implement timer functionality here
                },
                child: const Text('Timer'),
              ),
              // Check button
              ElevatedButton(
                onPressed: () {
                  // Implement check functionality here
                },
                child: const Text('Check'),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
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
                        color: Colors.black, width: (i % 4 == 1) ? 5 : 1),
                  ),
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value) {
                      if (!numbers.contains(value)) {
                        sudokuControllors[doubleToInt(i / 4)][i % 4].text = '';
                      } else {
                        for (var j = 0; j < 4; j++) {
                          if (sudokuControllors[doubleToInt(i / 4)][j].text ==
                                  value &&
                              j != (i % 4) &&
                              value != '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("something's wrong horizantally"),
                                  backgroundColor: Colors.red),
                            );
                          }
                          if (sudokuControllors[j][i % 4].text == value &&
                              j != (doubleToInt(i / 4)) &&
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
                    controller: sudokuControllors[doubleToInt(i / 4)][i % 4],
                    maxLength: 1,
                    style: TextStyle(
                        fontWeight: (sudokuControllors[doubleToInt(i / 4)]
                                        [i % 4]
                                    .text !=
                                "")
                            ? FontWeight.bold
                            : FontWeight.w400,
                        color: sudokuColor[doubleToInt(i / 4)][i % 4]),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    enabled:
                        sudokuControllors[doubleToInt(i / 4)][i % 4].text == "",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
