import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';

class StatisticsPagePersonal extends StatefulWidget {
  @override
  _StatisticsPagePersonalState createState() => _StatisticsPagePersonalState();
}

class _StatisticsPagePersonalState extends State<StatisticsPagePersonal> {
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
                    text: 'Statistics',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
