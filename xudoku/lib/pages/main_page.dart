import 'package:flutter/material.dart';
import 'package:xudoku/model/sudoku_model.dart';
import 'package:xudoku/pages/home_page.dart';
import 'package:xudoku/pages/item_page.dart';
import 'package:xudoku/pages/login_page.dart';
import 'package:xudoku/theme/theme.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  String username;
  Function changeTheme;
  ThemeChanger themeChanger;
  List<SudokuModel> sudokuList;

  MainPage({super.key, required this.username, required this.changeTheme, required this.themeChanger, required this.sudokuList});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int pageIndex = 0;
  List<Widget> pageList = [];

  @override
  void initState() {
    super.initState();
    pageList = [const HomePage(), ItemPage(username: widget.username, changeTheme: widget.changeTheme, themeChanger: widget.themeChanger, sudokuList: widget.sudokuList)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${widget.username}"),
        actions: [
          IconButton(
            onPressed: () {
              if(widget.themeChanger.themeMode == ThemeMode.dark) widget.changeTheme();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage(changeTheme: widget.changeTheme, themeChanger: widget.themeChanger, sudokuList: widget.sudokuList);
                    }
                  ),
                  (route) => false
                );
            },
            icon: const Icon(Icons.logout_outlined)
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  value: "change",
                  child: ListTile(
                    leading: Icon(widget.themeChanger.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
                    title: const Text("Change Theme", style: TextStyle(fontSize: 18))
                  )
                )
              ];
            },
            child: const Icon(Icons.more_vert),
            onSelected: (value) {
              setState(() {
                widget.changeTheme();
              });
            },
          ),
        ],
      ),
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
            tooltip: "Home",
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            tooltip: "Sudoku",
            label: "Sudoku",
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view_sharp)
          )
        ],
      ),
    );
  }
}
