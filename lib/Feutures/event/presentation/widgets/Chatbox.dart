import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  final String content;
  final String sender;
  final bool isDash;
  ChatBox(
      {super.key,
      required this.content,
      required this.sender,
      required this.isDash});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 300,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.sender,
            style: TextStyle(
                color: Color.fromARGB(255, 215, 215, 215), fontSize: 20),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        width: 300,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 27, 27, 27),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          child: widget.isDash
              ? AnimatedTextKit(
                  repeatForever: false,
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      widget.content,
                      speed: const Duration(milliseconds: 100),
                    )
                  ],
                )
              : Text(
                  widget.content,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
        ),
      ),
    ]);
  }
}
