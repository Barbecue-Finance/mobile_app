import 'package:flutter/material.dart';
import 'package:shashliki/home/books/api_books.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/personal_book/statistics_page_personal.dart';
import 'package:shashliki/shared_book/operation_model.dart';
import 'package:shashliki/shared_book/operation_widget.dart';

import 'add_action_page.dart';

class GroupDebitPage extends StatefulWidget {
  final int? groupId;

  const GroupDebitPage({Key? key, this.groupId}) : super(key: key);

  @override
  _GroupDebitPageState createState() => _GroupDebitPageState();
}

class _GroupDebitPageState extends State<GroupDebitPage> {
  List<OperationModel> operations = [];
  int purseId=0;

  _initOperations() async {
    purseId = await getPurseIdByGroupId(widget.groupId!);
    List<OperationModel> t = await getOperations(purseId);

    setState(() {
      operations = t;
    });
  }

  @override
  void initState() {
    _initOperations();

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
                    text: 'Debits',
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StatisticsPagePersonal()));
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: operations.length,
              itemBuilder: (BuildContext context, int index) {
                return OperationWidget(operation: operations[index]);
              },
            ),
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
                MaterialPageRoute(builder: (context) => AddActionPage(purseId: purseId,)));
          },
        ),
      ),
    );
  }
}
