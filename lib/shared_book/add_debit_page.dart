import 'package:flutter/material.dart';
import 'package:shashliki/home/books/api_books.dart';
import 'package:shashliki/non_component/custom_colors.dart';

class AddDebitPage extends StatefulWidget {
  @override
  _AddDebitPageState createState() => _AddDebitPageState();
}

class _AddDebitPageState extends State<AddDebitPage> {
  final nameController = TextEditingController();
  String _type = "group";
  double _width = 300;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    text: 'Add',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 5, top: 30),
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: 'Name',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
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
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                createGroup(nameController.text);
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(
                  text: 'Add',
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
