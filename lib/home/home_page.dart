import 'package:flutter/material.dart';
import 'package:shashliki/home/books/books_widget.dart';
import 'package:shashliki/home/profile/profile_widget.dart';
import 'package:shashliki/non_component/custom_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pageType = "books";

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
            ] +
            (() {
              switch (pageType) {
                case "books":
                  return <Widget>[BooksWidget()];
                case "account":
                  return <Widget>[ProfileWidget()];
                default:
                  return <Widget>[];
              }
            }()),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Container(
            decoration: BoxDecoration(
                color: mainBlue,
                border: Border(top: BorderSide(color: Colors.white))),
            child: Row(
              children: [
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.book),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: (() {
                    if (pageType == "books") {
                      return Colors.white;
                    }
                    return Colors.white30;
                  }()),
                  onPressed: () {
                    setState(() {
                      pageType = "books";
                    });
                  },
                ),
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.person),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: (() {
                    if (pageType == "account") {
                      return Colors.white;
                    }
                    return Colors.white30;
                  }()),
                  onPressed: () {
                    setState(() {
                      pageType = "account";
                    });
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )),
      ),
    );
  }
}
