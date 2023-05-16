import 'package:example/sqlDB.dart';
import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  const PageDetail({super.key, required String title});

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 121, 31, 24),
        centerTitle: true,
        title: const Text(
          'Pizza Recipe',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Card(
        child: Column(
          children: [
            Image.asset(
              'images/pizza.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 220,
            ),
            const Text("Ingredients :"),
            const Text('''
                        - 2 medium sized pizza dough
                        - 2 tbsp olive oil
                        - 2 tbsp garlic powder
                        - 2 tbsp ginger powder
                        - 2 tbsp garlic powder
                        - 2 tbsp ginger powder
                        - 2 tbsp garlic powder
                        
            '''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 121, 31, 24)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 35.0,
                            vertical: 20.0), // Adjust the padding values here
                      ),
                    ),
                    child: const Text("Delete Recipe")),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 121, 31, 24)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 35.0,
                            vertical: 20.0), // Adjust the padding values here
                      ),
                    ),
                    child: const Text("Modify Recipe")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
