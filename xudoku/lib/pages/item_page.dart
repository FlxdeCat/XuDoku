import 'package:flutter/material.dart';
import 'package:xudoku/model/sudoku_model.dart';
import 'package:xudoku/pages/detail_page.dart';
import 'package:xudoku/theme/theme.dart';

// ignore: must_be_immutable
class ItemPage extends StatefulWidget {
  String username;
  Function changeTheme;
  ThemeChanger themeChanger;
  List<SudokuModel> sudokuList;

  ItemPage({super.key, required this.username, required this.changeTheme, required this.themeChanger, required this.sudokuList});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Center(
                child: Text("Sudoku Puzzles",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            const Divider(
              height: 25,
              color: Colors.grey,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.sudokuList.length,
              itemBuilder: (context, index) {
                SudokuModel sudoku = widget.sudokuList[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(username: widget.username, changeTheme: widget.changeTheme, themeChanger: widget.themeChanger, sudokuList: widget.sudokuList, sudokuIndex: index);
                            }
                          ),
                          (route) => true
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: 165,
                              child: Image.asset(sudoku.image,
                                  fit: BoxFit.contain)),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sudoku.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  sudoku.rule,
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 25,
                      color: Colors.grey,
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
