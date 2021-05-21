import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shashliki/auth/api_auth.dart';
import 'package:shashliki/group_book/group_book_page.dart';
import 'package:shashliki/home/books/api_books.dart';
import 'package:shashliki/home/books/event_item.dart';
import 'package:shashliki/home/books/group_item.dart';
import 'package:shashliki/personal_book/personal_book_page.dart';
import 'package:shashliki/shared_book/add_debit_page.dart';
import 'package:shashliki/shared_book/join_debit_page.dart';

class BooksWidget extends StatefulWidget {
  @override
  _BooksWidgetState createState() => _BooksWidgetState();
}

class _BooksWidgetState extends State<BooksWidget> {
  List<GroupItem> group_items = [];

  _initGroups() async {
    List<GroupItem> t = await getGroups();
    acceptAllInvites();
    setState(() {
      group_items = t;
    });
  }

  @override
  void initState() {
    _initGroups();

    const secs=const Duration(seconds: 5);

    Timer.periodic(secs, (timer) {_initGroups();});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: group_items.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == group_items.length) {
            return Container(
              padding: EdgeInsets.only(left: 100, right: 100, top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddDebitPage()));
                },
                child: RichText(
                  text: TextSpan(
                    text: '+Add',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            );
          } else {
            return InkWell(
              child: Container(
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
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: group_items[index].name[0],
                            style:
                                TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: group_items[index].name,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GroupBookPage(
                              group: group_items[index],
                            )));
              },
            );
          }
        },
      ),
    );
  }
}
