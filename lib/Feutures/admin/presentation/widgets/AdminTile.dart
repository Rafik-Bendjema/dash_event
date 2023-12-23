import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminTile extends StatelessWidget {
  final String image;
  final String title;
  final void Function() inclick;
  const AdminTile(
      {super.key,
      required this.image,
      required this.title,
      required this.inclick});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      GestureDetector(
        onTap: inclick,
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF2AE6FF), Color(0x00E9E9E9)],
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 34, 34, 34),
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
      Positioned(
        right: 0,
        bottom: -10,
        child: Image.asset(
          "assets/images/$image",
          height: 60,
        ),
      )
    ]);
  }
}
