import 'package:flutter/material.dart';

class TP4 extends StatefulWidget {
  const TP4({super.key});

  @override
  State<TP4> createState() => _TP4State();
}

class _TP4State extends State<TP4> {
  int number1 = 0;
  int number2 = 0;
  double result = 0;
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  final resultControllor = TextEditingController();
  bool validatenum1 = false;
  bool validatenum2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: const Text(
          'TP 4',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: validatenum1 ? 'invalide input' : null,
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter a number',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: validatenum2 ? 'invalide input ' : null,
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter another number',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    try {
                      number1 = int.parse(num1Controller.text);
                      setState(() {
                        validatenum1 = false;
                      });
                    } catch (e) {
                      setState(() {
                        validatenum1 = true;
                      });
                    }
                    try {
                      number2 = int.parse(num2Controller.text);
                      setState(() {
                        validatenum2 = false;
                      });
                    } catch (e) {
                      setState(() {
                        validatenum2 = true;
                      });
                    }
                    if (!validatenum1 && !validatenum2) {
                      result = (number1 + number2) / 2;
                      resultControllor.text = '$result';
                    } else {
                      resultControllor.text = '';
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("invalide input, dude focus!"),
                            backgroundColor: Colors.red),
                      );
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('calculer'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    num1Controller.text = '';
                    num2Controller.text = '';
                    resultControllor.text = '';
                    setState(() {
                      validatenum1 = false;
                      validatenum2 = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Annuler"),
                          backgroundColor: Colors.red),
                    );
                  },
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Annuler'),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(50),
            child: Center(
              child: TextField(
                controller: resultControllor,
                decoration: const InputDecoration(
                  labelText: 'result',
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
