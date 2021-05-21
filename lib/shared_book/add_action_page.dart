import 'package:flutter/material.dart';
import 'package:shashliki/home/books/api_books.dart';
import 'package:shashliki/non_component/custom_colors.dart';

class AddActionPage extends StatefulWidget {
  final int? purseId;

  const AddActionPage({Key? key, this.purseId}) : super(key: key);

  @override
  _AddActionPageState createState() => _AddActionPageState();
}

class _AddActionPageState extends State<AddActionPage> {
  String _type = "spent";
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final purseIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlue,
      body: SingleChildScrollView(
        child: Column(
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
                          text: 'Add',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 20, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Name',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: nameController,
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
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: optionsGrey,
                      ),
                      margin: EdgeInsets.only(left: 5, top: 20, bottom: 5),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: optionsGrey,
                        ),
                        child: DropdownButton<String>(
                          underline: Container(),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 40,
                          ),
                          value: _type,
                          onChanged: (newValue) {
                            setState(() {
                              _type = newValue.toString();
                            });
                          },
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              child: RichText(
                                text: TextSpan(
                                  text: 'spent',
                                  style:
                                      TextStyle(color: maintRed, fontSize: 30),
                                ),
                              ),
                              value: "spent",
                            ),
                            DropdownMenuItem<String>(
                              child: RichText(
                                text: TextSpan(
                                  text: 'gained',
                                  style:
                                      TextStyle(color: mainGreen, fontSize: 30),
                                ),
                              ),
                              value: "gained",
                            ),
                            DropdownMenuItem<String>(
                              child: RichText(
                                text: TextSpan(
                                  text: 'transfered',
                                  style: TextStyle(
                                      color: Colors.yellow, fontSize: 30),
                                ),
                              ),
                              value: "transfered",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: priceController,
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
              ] +
              (() {
                if (_type == "transfered") {
                  return <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 20, bottom: 5),
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Transfer purse id',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(5),
                      child: TextField(
                        controller: purseIdController,
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
                    )
                  ];
                }
                return <Widget>[];
              }()) +
              [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      switch (_type) {
                        case "spent":
                          createOutcome(double.parse(priceController.text),
                              nameController.text, widget.purseId!);
                          break;
                        case "gained":
                          createIncome(double.parse(priceController.text),
                              nameController.text, widget.purseId!);
                          break;
                        case "transfered":
                          createTransfer(
                              double.parse(priceController.text),
                              nameController.text,
                              widget.purseId!,
                              int.parse(purseIdController.text));
                          break;
                        default:
                          break;
                      }
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: '+Add',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
        ),
      ),
    );
  }
}
