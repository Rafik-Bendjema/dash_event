import 'package:flutter/material.dart';

class NotioficationField extends StatefulWidget {
  const NotioficationField({super.key});

  @override
  State<NotioficationField> createState() => _NotioficationFieldState();
}

class _NotioficationFieldState extends State<NotioficationField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        "notification",
        style: TextStyle(fontSize: 20),
      ),
      Container(
          padding: EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          width: 100,
          height: 50,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 189, 189, 189),
                    Color(0Xff23DCFF)
                  ])))
    ]));
  }
}
