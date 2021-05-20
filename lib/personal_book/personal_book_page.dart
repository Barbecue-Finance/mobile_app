import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/personal_book/statistics_page_personal.dart';
import 'package:shashliki/shared_book/add_action_page.dart';

class PersonalBookPage extends StatefulWidget {
  @override
  _PersonalBookPageState createState() => _PersonalBookPageState();
}

class _PersonalBookPageState extends State<PersonalBookPage> {
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
                    text: 'Personal',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'show statistics',
                      style: TextStyle(color: Colors.grey, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StatisticsPagePersonal()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: mainBlue,
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: '+add',
                    style: TextStyle(color: Colors.grey, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddActionPage()));
          },
        ),
      ),
    );
  }
}
