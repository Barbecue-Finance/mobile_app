import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shashliki/home/books/api_books.dart';
import 'package:shashliki/home/books/group_item.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/shared_book/member_model.dart';

import 'member_widget.dart';

class MembersPage extends StatefulWidget {
  final GroupItem? group;

  const MembersPage({Key? key, this.group}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  List<MemberModel> _members = [];
  final idController = TextEditingController();

  @override
  void initState() {
    setState(() {
      _members.addAll(widget.group!.users.map((e) => MemberModel(e.username,e.id)));
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
                    text: 'Members',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _members.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == _members.length) {
                  return Container(
                    margin: EdgeInsets.only(top:30),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Id:',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.all(5),
                          width: 280,
                          child: TextField(
                            controller: idController,
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
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: Icon(Icons.add_circle_outline_rounded),
                          onPressed: () {
                            sendInvite(int.parse(idController.text),
                                widget.group!.id, context);
                          },
                        ),
                      ],
                    ),
                  );
                }
                return MemberWidget(member: _members[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
