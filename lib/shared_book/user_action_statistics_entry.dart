import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/non_component/singleton_ds.dart';
import 'package:shashliki/shared_book/user_action.dart';

class UserActionStatisticsEntry extends StatefulWidget {
  final int? userId;
  final String? userName;
  final double? userSpent;
  final double? userGained;

  const UserActionStatisticsEntry(
      {Key? key, this.userId, this.userName, this.userGained, this.userSpent})
      : super(key: key);

  @override
  _UserActionStatisticsEntryState createState() =>
      _UserActionStatisticsEntryState();
}

class _UserActionStatisticsEntryState extends State<UserActionStatisticsEntry> {
  SingletonDS ds = SingletonDS();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (() {
            if (widget.userId != ds.userId) {
              return Container(
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: widget.userName![0],
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
            );
            }
            return Container();
          }()),
          RichText(
            text: TextSpan(
              text: (() {
                if (widget.userId == ds.userId) {
                  return "You";
                }
                return widget.userName;
              }()),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "-" + widget.userSpent.toString(),
              style: TextStyle(color: mainRed, fontSize: 30),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "+" + widget.userGained.toString(),
              style: TextStyle(color: mainGreen, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
