import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/shared_book/operation_model.dart';

class OperationWidget extends StatefulWidget {
  final OperationModel? operation;

  const OperationWidget({Key? key, this.operation}) : super(key: key);

  @override
  _OperationWidgetState createState() => _OperationWidgetState();
}

class _OperationWidgetState extends State<OperationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: optionsGrey,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: (() {
        switch (widget.operation!.type) {
          case "outcoming":
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
                    text: widget.operation!.amount.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            );
          default:
            break;
        }
        return Column(
          children: [
            RichText(
              text: TextSpan(
                text: widget.operation!.comment,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        );
      }()),
    );
  }
}
