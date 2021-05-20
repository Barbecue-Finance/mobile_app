import 'package:flutter/material.dart';
import 'package:shashliki/non_component/singleton_ds.dart';

import 'member_model.dart';

class MemberWidget extends StatefulWidget {
  final MemberModel? member;

  const MemberWidget({Key? key, this.member}) : super(key: key);
  @override
  _MemberWidgetState createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  SingletonDS ds = SingletonDS();

  @override
  Widget build(BuildContext context) {
    if (ds.userId == widget.member!.id) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.white),
                bottom: BorderSide(color: Colors.white))),
        child: Row(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              margin: EdgeInsets.symmetric(horizontal: 5),
            ),
            RichText(
              text: TextSpan(
                text: "You",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: widget.member!.name[0],
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 5),
          ),
          RichText(
            text: TextSpan(
              text: widget.member!.name,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
