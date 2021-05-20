import 'package:flutter/material.dart';
import 'package:shashliki/shared_book/user_action_statistics_entry.dart';
import 'package:shashliki/shared_book/user_action.dart';

class PersonalStatisticsWidget extends StatefulWidget {
  @override
  _PersonalStatisticsWidgetState createState() =>
      _PersonalStatisticsWidgetState();
}

class _PersonalStatisticsWidgetState extends State<PersonalStatisticsWidget> {
  bool expanded = false;
  List<UserAction> _actions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'You',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            IconButton(
              iconSize: 35,
              icon: Icon((() {
                if (!expanded) {
                  return Icons.keyboard_arrow_down;
                }
                return Icons.keyboard_arrow_up;
              }())),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.white,
              onPressed: () {
                expanded = !expanded;
              },
            ),
          ],
        ),
        (() {
          if (!expanded) {
            return Container();
          }
          return ListView.builder(
            itemCount: _actions.length,
            itemBuilder: (BuildContext context, int index) {
              return UserActionStatisticsEntry(userAction: _actions[index]);
            },
          );
        }())
      ],
    );
  }
}
