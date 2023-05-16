import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<Map<String, dynamic>>> searchInDatabase(
      String searchKeyword) async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      join(databasePath, 'your_database.db'),
    );

    final results = await database.rawQuery(
      'SELECT * FROM your_table WHERE column_name LIKE ?',
      ['%$searchKeyword%'],
    );

    await database.close();

    return results;
  }

  void main() async {
    final searchResults = await searchInDatabase('search_query');
    print(searchResults);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 127, 228),
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                  hintText: "Search here ...",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.black26)),
            ),
          ],
        ),
      ),
    );
  }
}
