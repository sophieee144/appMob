import 'package:example/screens/pageDetails.dart';
import 'package:example/sqlDB.dart';
import 'package:flutter/material.dart';

import 'SearchPage.dart';
import 'addRecipe.dart';

class TP6 extends StatelessWidget {
  SqlDB sqlDB = SqlDB();

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDB.readData("SELECT * FROM recipes");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: 200,
          backgroundColor: Colors.white70,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => RecipesPage()),
                  // );
                },
                child: const ListTile(
                  leading: Icon(Icons.menu_book),
                  title: Text('Recipes'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchPage()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.search),
                  title: Text('Search'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddRecipe()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Add yours'),
                ),
              ),
            ],
          )),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: const Text(
          'Food Recipe',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          List<String> titles = [
            'Sweet',
            'Pizza',
            'Pan cake',
            'Chickens',
            'minitarte'
          ];
          List<String> imagePaths = [
            'images/tarte.jpg',
            'images/pizza.jpg',
            'images/pancake.jpg',
            'images/chipss.jpg',
            'images/minitarte.jpg',
            'images/minitarte.jpg',
          ];

          return GestureDetector(
            onTap: () {
              // Define the navigation logic here
              // For example, you can use Navigator.push to navigate to a new page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageDetail(title: titles[index])),
              );
            },
            child: Card(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                    width: 370,
                    height: 220,
                  ),
                  Text(titles[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
