import 'package:example/screens/tp6.dart';
import 'package:example/sqlDB.dart';
import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  SqlDB sqlDB = SqlDB();

  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController titre = TextEditingController();
  TextEditingController etapes = TextEditingController();
  TextEditingController keywords = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: const Text(
          'Add Recipe',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Form(
              key: formstate,
              child: Column(children: [
                TextFormField(
                  controller: titre,
                  decoration: const InputDecoration(hintText: "title"),
                ),
                TextFormField(
                  controller: etapes,
                  decoration: const InputDecoration(hintText: "etapes"),
                ),
                TextFormField(
                  controller: keywords,
                  decoration: const InputDecoration(hintText: "keywords"),
                ),
                Container(
                  height: 20,
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () async {
                    int response = await sqlDB.insertData('''
                    
                    INSERT INTO recipes (`titre`, `etapes`, `keywords`) 
                    VALUES ("${titre.text}", "${etapes.text}", "${keywords.text}")''');
                    print("khra");
                    if (response > 0) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => TP6()),
                          (route) => false);
                    }
                  },
                  child: const Text("Add"),
                )
              ]))
        ]),
      ),
    );
  }
}
