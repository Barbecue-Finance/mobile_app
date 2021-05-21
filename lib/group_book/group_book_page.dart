import 'package:flutter/material.dart';
import 'package:shashliki/chat/chat_page.dart';
import 'package:shashliki/home/books/api_books.dart';
import 'package:shashliki/home/books/group_item.dart';
import 'package:shashliki/home/home_page.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/shared_book/group_debit_page.dart';
import 'package:shashliki/shared_book/members_page.dart';

class GroupBookPage extends StatefulWidget {
  final GroupItem? group;

  const GroupBookPage({Key? key, this.group}) : super(key: key);
  @override
  _GroupBookPageState createState() => _GroupBookPageState();
}

class _GroupBookPageState extends State<GroupBookPage> {
  int purseId = 0;

  _initId() async {
    purseId = await getPurseIdByGroupId(widget.group!.id);
    setState(() {});
  }

  @override
  void initState() {
    _initId();

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
                    text: widget.group!.name,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: widget.group!.name[0],
                  style: TextStyle(color: Colors.black, fontSize: 100),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5,bottom: 30),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "purse id: " + purseId.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 30),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 50,
                          color: Colors.white,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'debits',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GroupDebitPage(
                                  groupId: widget.group!.id,
                                  group: widget.group!,
                                )));
                  },
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(color: Colors.white))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat,
                          size: 50,
                          color: Colors.white,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'chat',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatPage(
                                  groupId: widget.group!.id,
                                )));
                  },
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.group,
                          size: 50,
                          color: Colors.white,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'members',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MembersPage(group: widget.group)));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
