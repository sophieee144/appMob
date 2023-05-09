import 'package:flutter/material.dart';

class TP2 extends StatefulWidget {
  const TP2({super.key});

  @override
  State<TP2> createState() => _TP2State();
}

class _TP2State extends State<TP2> {
  final user = TextEditingController();
  final pw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          'TP 2',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: user,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "username",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: pw,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                labelText: "password",
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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "user name = ${user.text} \n password = ${pw.text}"),
                        backgroundColor: Colors.green));
                  },
                  icon: const Icon(Icons.check),
                  label: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Valider'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    user.text = "";
                    pw.text = "";
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
          )
        ],
      ),
    );
  }
}
