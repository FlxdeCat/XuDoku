import 'package:flutter/material.dart';
import 'package:xudoku/model/sudoku_model.dart';
import 'package:xudoku/pages/main_page.dart';
import 'package:xudoku/theme/theme.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  Function changeTheme;
  ThemeChanger themeChanger;
  List<SudokuModel> sudokuList;
  
  LoginPage({super.key, required this.changeTheme, required this.themeChanger, required this.sudokuList});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? usernameErrorMessage;
  String? passwordErrorMessage;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool agree = false;
  bool subscribe = false;

  void resetError() {
    setState(() {
      usernameErrorMessage = null;
      passwordErrorMessage = null;
    });
  }

  void handleLogin() {
    String username = usernameController.text;
    String password = passwordController.text;
    resetError();

    if (username.isEmpty) {
      setState(() {
        usernameErrorMessage = "Please enter your username";
      });
      return;
    }
    if (password.isEmpty) {
      setState(() {
        passwordErrorMessage = "Please enter your password";
      });
      return;
    }
    if (username.length < 5) {
      setState(() {
        usernameErrorMessage = "Username must be at least 5 characters";
      });
      return;
    }
    if (username.contains(' ')) {
      setState(() {
        usernameErrorMessage = "Username cannot have any spaces";
      });
      return;
    }
    if (agree == false) {
      SnackBar sb = const SnackBar(
        content: Text("You must agree to the Terms & Conditions"),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(sb);
      return;
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MainPage(username: username, changeTheme: widget.changeTheme, themeChanger: widget.themeChanger, sudokuList: widget.sudokuList);
        }
      ),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset("assets/logo.png"),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: usernameController,
                    decoration: InputDecoration(
                        hintText: "Username",
                        labelText: "Input your username here",
                        errorText: usernameErrorMessage,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        hintStyle: const TextStyle(fontSize: 20),
                        labelStyle: const TextStyle(fontSize: 20),
                        errorStyle: const TextStyle(fontSize: 17)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Input your password here",
                        errorText: passwordErrorMessage,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        hintStyle: const TextStyle(fontSize: 20),
                        labelStyle: const TextStyle(fontSize: 20),
                        errorStyle: const TextStyle(fontSize: 17)),
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text("I agree to the Terms & Conditions",
                        style: TextStyle(fontSize: 17)),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: const Text(
                        "I want to subscribe to your monthly news",
                        style: TextStyle(fontSize: 17)),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    value: subscribe,
                    onChanged: (value) {
                      setState(() {
                        subscribe = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 40)),
                      onPressed: handleLogin,
                      child:
                          const Text("Login", style: TextStyle(fontSize: 18))),
                ],
              ),
            ),
          ),
        ));
  }
}
