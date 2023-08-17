import 'package:flutter/material.dart';
import 'package:xudoku/model/sudoku_model.dart';
import 'package:xudoku/pages/login_page.dart';
import 'package:xudoku/theme/theme.dart';

void main(List<String> args) {
  runApp(const XuDoku());
}

class XuDoku extends StatefulWidget {
  const XuDoku({super.key});

  @override
  State<XuDoku> createState() => _XuDokuState();
}

class _XuDokuState extends State<XuDoku> {
  final ThemeChanger themeChanger = ThemeChanger();

  void changeTheme() {
    setState(() {
      themeChanger.changeTheme();
    });
  }

  List<SudokuModel> sudokuList = [
    SudokuModel(
        title: "Classic Sudoku 1",
        image: "assets/basic/basic3.png",
        rule: "Normal sudoku rules apply.",
        fullRule: "Normal sudoku rules apply.",
        reviews: []),
    SudokuModel(
        title: "Classic Sudoku 2",
        image: "assets/basic/basic4.png",
        rule: "Normal sudoku rules apply.",
        fullRule: "Normal sudoku rules apply.",
        reviews: []),
    SudokuModel(
        title: "Classic Sudoku 3",
        image: "assets/basic/basic5.png",
        rule: "Normal sudoku rules apply.",
        fullRule: "Normal sudoku rules apply.",
        reviews: []),
    SudokuModel(
        title: "Arrow Sudoku",
        image: "assets/special/arrow.png",
        rule:
            "Normal sudoku rules apply. Digits along arrows sum to the number in the circle/pill. 2-digit numbers in pills are written left-to right or top-to-bottom.",
        fullRule:
            "Normal sudoku rules apply. Digits along arrows sum to the number in the circle/pill. 2-digit numbers in pills are written left-to right or top-to-bottom.",
        reviews: []),
    SudokuModel(
        title: "Killer Sudoku",
        image: "assets/special/killer.png",
        rule:
            "Normal sudoku rules apply. Digits cannot repeat in cages which may or may not show their sum.",
        fullRule:
            "Normal sudoku rules apply. Digits cannot repeat in cages which may or may not show their sum.",
        reviews: []),
    SudokuModel(
        title: "Diagonal Sudoku",
        image: "assets/special/diagonal.png",
        rule:
            "Normal sudoku rules apply. Digits along the indicated diagonal cannot repeat.",
        fullRule:
            "Normal sudoku rules apply. Digits along the indicated diagonal cannot repeat.",
        reviews: []),
    SudokuModel(
        title: "Thermo Sudoku",
        image: "assets/special/thermo.png",
        rule:
            "Normal sudoku rules apply. Digits along thermometers must strictly increase from bulb to tip.",
        fullRule:
            "Normal sudoku rules apply. Digits along thermometers must strictly increase from bulb to tip.",
        reviews: []),
    SudokuModel(
        title: "Chaos Sudoku 1",
        image: "assets/chaos/1.png",
        rule:
            "Normal sudoku rules apply. However, the answer will have every clue be invalid. See more details here...",
        fullRule:
            "Normal sudoku rules apply. However, the answer will have every clue be invalid. Clues are valid if digits in a killer cage sum up to the small clue in the top left of the cage, clues outside the grid are correct X-sums (Clues that show the sum of the first X digits in that direction where X is the 1st digit), clues outside the grid are correct skyscraper clues (The digits in the grid represent the 'heights' of skyscrapers. Clues represent the number of skyscrapers seen from that direction. Taller skyscrapers block shorter ones), digits on a thermometer increase from the bulb end, digits separated by a black dot has a ratio of 1:2, digits separated by a white dot are consecutive, digits separated by X have a sum of 10, digits separated by V have a sum of 5, all digits in a circle appear in the 4 cells touching it, and maximum cells are larger than all 4 adjacent cells.",
        reviews: []),
    SudokuModel(
        title: "Chaos Sudoku 2",
        image: "assets/chaos/2.png",
        rule:
            "Normal sudoku rules apply. However, every clue is lying to you! See more details here...",
        fullRule:
            "Normal sudoku rules apply. However, every clue is lying to you! The thermometer bulb is not where it says it is (but is still on the thermo, and each thermo cannot contain a repeated digit). Killer cages don't sum to the number in the corner. Little killer arrows do not give the sum of cells on their diagonal. X and V clues mean the adjoining cells don't add to 10 or 5 respectively. The palindrome line does not contain a palindrome. Black kropki dots mean neither adjoining cell is half of the other. Maximum cells (in blue) are not greater than all four adjacent cells. Cells touching 'quadruple circles' do not include all digits within the circle (but may include some of them).",
        reviews: []),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XuDoku",
      theme: lightThemeMode,
      darkTheme: darkthemeMode,
      themeMode: themeChanger.themeMode,
      home: LoginPage(changeTheme: changeTheme, themeChanger: themeChanger, sudokuList: sudokuList),
    );
  }
}
