import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';

class JoinDebitPage extends StatefulWidget {
  @override
  _JoinDebitPageState createState() => _JoinDebitPageState();
}

class _JoinDebitPageState extends State<JoinDebitPage> {
  final linkController = TextEditingController();

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
                    text: 'Join',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5,top: 20,bottom: 5),
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: 'Link',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(5),
            child: TextField(
              controller: linkController,
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
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(
                  text: 'Join',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
