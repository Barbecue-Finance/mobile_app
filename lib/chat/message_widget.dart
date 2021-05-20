import 'package:flutter/material.dart';
import 'package:shashliki/chat/message_model.dart';
import 'package:shashliki/non_component/singleton_ds.dart';

class MessageWidget extends StatefulWidget {
  final MessageModel? message;

  const MessageWidget({Key? key, this.message}) : super(key: key);
  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  SingletonDS ds = SingletonDS();

  @override
  Widget build(BuildContext context) {
    return (() {
      if (widget.message!.userId == ds.userId) {
        return Row(
          children: [
            Expanded(child: Container()),
            Container(
                constraints: BoxConstraints(maxWidth: 300),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(155, 55, 179, 74),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: widget.message!.text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20)))),
          ],
        );
      }
      return Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            width: 20.0,
            height: 20.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(155, 255, 105, 0),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: RichText(
                text: TextSpan(
                    text: widget.message!.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20))),
          )
        ],
      );
    }());
  }
}
