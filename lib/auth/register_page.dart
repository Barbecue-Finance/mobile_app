import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';

import 'api_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();


  _register() {
    register(
        RegisterDto(
            username: nameController.text,
            login: loginController.text,
            password: passwordController.text),
        context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlue,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colors.transparent,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white))),
            child: Row(
              children: [
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.arrow_back_ios),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: 'Register',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          RichText(
              text: TextSpan(
                text: 'name',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(5),
              child: TextField(
                controller: nameController,
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
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        _register();
                        Navigator.pop(context);
                      },
                      child: RichText(
                          text: TextSpan(
                              text: 'REGISTER',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}