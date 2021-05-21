import 'package:flutter/material.dart';
import 'package:shashliki/home/books/api_books.dart';
import 'package:shashliki/home/books/group_item.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/shared_book/user_action_statistics_entry.dart';

import 'member_model.dart';
import 'operation_model.dart';

class StatisticsPage extends StatefulWidget {
  final List<OperationModel?>? operations;
  final GroupItem? group;

  const StatisticsPage({Key? key, this.operations, this.group})
      : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<MemberModel> _members = [];

  double _getSpentByUserId(int userId)
  {
    double rez=0;
    widget.operations!.where((element) => element!.userId==userId).where((element) => element!.type=="outcoming").forEach((element) {rez+=element!.amount;});

    return rez;
  }
  double _getGainedByUserId(int userId)
  {
    double rez=0;
    widget.operations!.where((element) => element!.userId==userId).where((element) => element!.type=="incoming").forEach((element) {rez+=element!.amount;});

    return rez;
  }

  @override
  void initState() {
    setState(() {
      _members.addAll(
          widget.group!.users.map((e) => MemberModel(e.username, e.id)));
    });

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
                    text: 'Statistics',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.group!.users.length,
              itemBuilder: (BuildContext context, int index) {
                GroupUserDto user= widget.group!.users[index];
                return UserActionStatisticsEntry(userId: user.id,userGained: _getGainedByUserId(user.id),userSpent: _getSpentByUserId(user.id),userName: user.username,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
