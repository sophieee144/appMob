import 'package:flutter/material.dart';

class TP1 extends StatelessWidget {
  const TP1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          'TP 1',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: const Text(
        "Bouledroua Fatma Zahra + Cheddadi Khalil Abderahmane + Diabi Hadia",
        style: TextStyle(color: Colors.blue, fontSize: 30),
      ),
    );
  }
}