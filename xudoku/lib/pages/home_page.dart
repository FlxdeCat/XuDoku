import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var sudokuList = [
    Image.asset("assets/basic/basic1.png"),
    Image.asset("assets/special/kropkiXV.png"),
    Image.asset("assets/chaos/3.png")
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CarouselSlider(
              items: sudokuList,
              options: CarouselOptions(
                height: 350,
                autoPlay: true,
                autoPlayInterval: const Duration(
                  seconds: 5
                ),
                enlargeCenterPage: true,
                enlargeFactor: 50
              ),
            ),
            const Divider(color: Colors.grey, height: 15, thickness: 2),
            const Text("XuDoku", style: TextStyle(fontSize: 40, color: Colors.purple)),
            const Text("The Sudoku Puzzlers' Dream", style: TextStyle(fontSize: 20)),
            const Divider(color: Colors.grey, height: 30, thickness: 2),
            Row(
              children: [
                SizedBox(
                  width: 165,
                  child: Image.asset("assets/basic/basic2.png", fit: BoxFit.contain)
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Classic Sudoku",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("The rules for sudoku are simple. A 9x9 square must be filled in with numbers from 1-9 with no repeated numbers in each row, column, and 3x3 box",
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sudoku Variants",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("Variations of the Classic Sudoku. Classic Sudoku rules apply, but with additional rules or twists that introduces new logic and way of thinking to solve.",
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 165,
                  child: Image.asset("assets/special/whisper.png", fit: BoxFit.contain)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}