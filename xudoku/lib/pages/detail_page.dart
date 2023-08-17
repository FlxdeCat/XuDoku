import 'package:flutter/material.dart';
import 'package:xudoku/model/review_model.dart';
import 'package:xudoku/model/sudoku_model.dart';
import 'package:xudoku/pages/login_page.dart';
import 'package:xudoku/theme/theme.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String username;
  Function changeTheme;
  ThemeChanger themeChanger;
  List<SudokuModel> sudokuList;
  int sudokuIndex;

  DetailPage(
      {super.key,
      required this.username,
      required this.changeTheme,
      required this.themeChanger,
      required this.sudokuList,
      required this.sudokuIndex});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController reviewController = TextEditingController();

  void handlePostReview() {
    String review = reviewController.text;
    if (review.isEmpty) {
      SnackBar sb = const SnackBar(
        content: Text("Review cannot be empty!"),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(sb);
      return;
    }
    setState(() {
      widget.sudokuList[widget.sudokuIndex].reviews
          .add(ReviewModel(username: widget.username, review: review));
    });
    reviewController.clear();
    SnackBar sb = const SnackBar(
      content: Text("Review has been posted!"),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(sb);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(child: Image.asset("assets/logo.png")),
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text("Logout", style: TextStyle(fontSize: 18)),
                  onTap: () {
                    if (widget.themeChanger.themeMode == ThemeMode.dark) {
                      widget.changeTheme();
                    }
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage(
                          changeTheme: widget.changeTheme,
                          themeChanger: widget.themeChanger,
                          sudokuList: widget.sudokuList);
                    }), (route) => false);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text("Welcome, ${widget.username}"),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return <PopupMenuEntry>[
                    PopupMenuItem(
                        value: "change",
                        child: ListTile(
                            leading: Icon(
                                widget.themeChanger.themeMode == ThemeMode.light
                                    ? Icons.dark_mode
                                    : Icons.light_mode),
                            title: const Text("Change Theme",
                                style: TextStyle(fontSize: 18))))
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
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.mode),
                  child: Text("Detail"),
                ),
                Tab(
                  icon: Icon(Icons.mode_comment),
                  child: Text("Reviews"),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(widget.sudokuList[widget.sudokuIndex].image),
                      const Divider(
                          height: 20, color: Colors.grey, thickness: 2),
                      Text(widget.sudokuList[widget.sudokuIndex].title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(widget.sudokuList[widget.sudokuIndex].fullRule,
                          softWrap: true, textAlign: TextAlign.justify),
                      const Divider(
                          height: 30, color: Colors.grey, thickness: 2),
                      TextField(
                          style: const TextStyle(fontSize: 20),
                          controller: reviewController,
                          decoration: const InputDecoration(
                              hintText: "Review",
                              labelText: "Review the puzzle here",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              hintStyle: TextStyle(fontSize: 20),
                              labelStyle: TextStyle(fontSize: 20))),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 40)),
                          onPressed: handlePostReview,
                          child: const Text("Post Review",
                              style: TextStyle(fontSize: 18))),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Center(
                          child: Text("Puzzle Reviews",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                      const Divider(
                        height: 25,
                        color: Colors.grey,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget
                            .sudokuList[widget.sudokuIndex].reviews.length,
                        itemBuilder: (context, index) {
                          ReviewModel review = widget
                              .sudokuList[widget.sudokuIndex].reviews[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(review.username, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.justify, softWrap: true),
                              const SizedBox(height: 5),
                              Text(review.review, textAlign: TextAlign.justify, softWrap: true),
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
              )
            ],
          )),
    );
  }
}
