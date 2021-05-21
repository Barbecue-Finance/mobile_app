import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/non_component/singleton_ds.dart';
import 'package:shashliki/shared_book/operation_model.dart';

class OperationWidget extends StatefulWidget {
  final OperationModel? operation;

  const OperationWidget({Key? key, this.operation}) : super(key: key);

  @override
  _OperationWidgetState createState() => _OperationWidgetState();
}

class _OperationWidgetState extends State<OperationWidget> {
  SingletonDS ds = SingletonDS();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (() {
          if (widget.operation!.userId == ds.userId) {
            return Expanded(child: Container());
          }
          return Container(
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
                  text: widget.operation!.userName[0],
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
          );
        }()),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          width: 250,
          decoration: BoxDecoration(
            color: optionsGrey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: (() {
            if (widget.operation!.type == "outcoming") {
              return Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: widget.operation!.comment,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "-" + widget.operation!.amount.toString(),
                      style: TextStyle(color: mainRed, fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      text: TextSpan(
                        text: widget.operation!.dateTime.substring(5, 10) +
                            " " +
                            widget.operation!.dateTime.substring(11, 16),
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                  )
                ],
              );
            }
            return Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: widget.operation!.comment,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "+" + widget.operation!.amount.toString(),
                    style: TextStyle(color: mainGreen, fontSize: 30),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: RichText(
                    text: TextSpan(
                      text: widget.operation!.dateTime.substring(5, 10) +
                          " " +
                          widget.operation!.dateTime.substring(11, 16),
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                )
              ],
            );
          }()),
        ),
      ],
    );
  }
}
