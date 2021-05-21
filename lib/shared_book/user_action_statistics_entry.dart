import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/shared_book/user_action.dart';

class UserActionStatisticsEntry extends StatefulWidget {
  final UserAction? userAction;
  const UserActionStatisticsEntry({Key? key, this.userAction})
      : super(key: key);

  @override
  _UserActionStatisticsEntryState createState() =>
      _UserActionStatisticsEntryState();
}

class _UserActionStatisticsEntryState extends State<UserActionStatisticsEntry> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: widget.userAction!.productName,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        RichText(
          text: TextSpan(
            text: widget.userAction!.summ.toString(),
            style: TextStyle(color: (() {
              if(widget.userAction!.type=="spent")
              {
                return maintRed;
              }
              return mainGreen;
            }()), fontSize: 30),
          ),
        ),
      ],
    );
  }
}
