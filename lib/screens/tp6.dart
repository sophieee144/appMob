import 'package:flutter/material.dart';

class TP6 extends StatelessWidget {
  const TP6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Recepises'),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add yours'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Resepise',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Center(
                child: Image.asset(
              index == 0
                  ? "images/tarte.jpg"
                  : index == 1
                      ? "images/pizza.jpg"
                      : index == 2
                          ? "images/pancake.jpg"
                          : index == 3
                              ? "images/chips.jpg"
                              : "",
            )),
          ),
        ),
      ),
    );
  }
}
