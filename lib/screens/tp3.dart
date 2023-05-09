import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class TP3 extends StatefulWidget {
  const TP3({super.key});

  @override
  State<TP3> createState() => _TP3State();
}

class _TP3State extends State<TP3> {
  double rating = 0.0;
  final _text = TextEditingController();
  final name = TextEditingController();
  bool _validateName = false;
  bool _validateComment = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'TP 3',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Text("Product name"),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: name,
                    decoration: InputDecoration(
                      errorText:
                          _validateName ? 'invalide lenght of comment ' : null,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmoothStarRating(
                      onRatingChanged: (v) {
                        rating = v;
                        setState(() {});
                      },
                      starCount: 5,
                      rating: rating,
                      size: 40.0,
                      filledIconData: Icons.star,
                      color: Colors.amber.shade700,
                      borderColor: Colors.amber,
                      spacing: 0.0),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(right: 30, left: 145),
              child: TextField(
                controller: _text,
                maxLines: 8,
                maxLength: 60,
                decoration: InputDecoration(
                    hintText: 'Comment here',
                    errorText:
                        _validateComment ? 'invalide lenght of comment ' : null,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _text.text.isEmpty || _text.text.length < 20
                            ? _validateComment = true
                            : _validateComment = false;

                        name.text.isEmpty
                            ? _validateName = true
                            : _validateName = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Send'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _text.text = "";
                      name.text = "";
                      rating = 0;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textStyle: const TextStyle(fontSize: 18)),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
}
