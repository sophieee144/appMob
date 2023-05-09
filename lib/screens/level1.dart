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
        9, (_) => List.generate(9, (_) => TextEditingController()));
    List<List<bool>> sudokuValid =
        List.generate(9, (_) => List.generate(9, (_) => true));
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        sudokuControllors[i][j].text = '';
      }
    }
    sudokuControllors[0][0].text = '5';
    sudokuControllors[0][1].text = '6';
    sudokuControllors[1][1].text = '7';
    List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', ''];
    List<List<Color>> sudokuColor =
        List.generate(9, (_) => List.generate(9, (_) => Colors.black));
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
      body: GridView.builder(
        itemCount: 81,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
        itemBuilder: (context, i) => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Colors.black,
                  width: (doubleToInt(i / 9) == 2 || doubleToInt(i / 9) == 5)
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
                            content: Text("something's wrong horizantally"),
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
                  fontWeight:
                      (sudokuControllors[doubleToInt(i / 9)][i % 9].text != "")
                          ? FontWeight.bold
                          : FontWeight.w400,
                  color: sudokuColor[doubleToInt(i / 9)][i % 9]),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              enabled: sudokuControllors[doubleToInt(i / 9)][i % 9].text == "",
            ),
          ),
        ),
      ),
    );
  }
}
