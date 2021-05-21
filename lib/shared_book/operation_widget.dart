import 'package:flutter/material.dart';
import 'package:shashliki/non_component/custom_colors.dart';
import 'package:shashliki/shared_book/operation_model.dart';

class OperationWidget extends StatefulWidget {
  final OperationModel? operation;
  final int? currentPurseId;

  const OperationWidget({Key? key, this.operation, this.currentPurseId})
      : super(key: key);

  @override
  _OperationWidgetState createState() => _OperationWidgetState();
}

class _OperationWidgetState extends State<OperationWidget> {
  @override
  void initState() {
    super.initState();
  }

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
        if (widget.operation!.type == "outcoming") {
          if (widget.operation!.purseId != widget.currentPurseId!) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: widget.operation!.comment,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: widget.operation!.comment,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: "-" + widget.operation!.amount.toString(),
                    style: TextStyle(color: maintRed, fontSize: 30),
                  ),
                ),
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
                  text: "-" + widget.operation!.amount.toString(),
                  style: TextStyle(color: maintRed, fontSize: 30),
                ),
              ),
            ],
          );
        }
        if (widget.operation!.purseId != widget.currentPurseId!) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: widget.operation!.comment,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: widget.operation!.comment,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: "+" + widget.operation!.amount.toString(),
                  style: TextStyle(color: mainGreen, fontSize: 30),
                ),
              ),
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
          ],
        );
      }()),
    );
  }
}
