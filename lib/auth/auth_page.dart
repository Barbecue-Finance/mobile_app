import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shashliki/auth/register_page.dart';
import 'package:shashliki/non_component/custom_colors.dart';

import 'api_auth.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  _login() {
    login(loginController.text, passwordController.text, context);
  }

  void _changeColor() {
    setState(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: mainBlue,
      ));
    });
  }

  @override
  void initState() {
    _changeColor();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 45, 72),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.transparent,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 80,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'shashlik finance',
                    style: TextStyle(color: Colors.grey, fontSize: 30),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      controller: loginController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                  Text(' '),
                  RichText(
                    text: TextSpan(
                      text: 'password',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                  Text(' '),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                            onPressed: () {
                              _login();
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: 'SIGN IN',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: 'REGISTER',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
