import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late List<int> deference;
  late var timer;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    if (mounted) {
      timer = Timer.periodic(
          const Duration(seconds: 60), (Timer t) => setState(() {}));
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  final DateTime _time = DateTime(2024, 1, 2, 00, 00);

  List<int> getDifference() {
    Duration difference = _time.difference(DateTime.now());

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;

    return [days, hours, minutes];
  }

  @override
  Widget build(BuildContext context) {
    deference = getDifference();
    print("page reloaded");
    print("this is the time  $_time");
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  color: Color(0xFFB7F1FF),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                  child: Text(
                deference[0].toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 80,
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "d",
                  style: TextStyle(
                      color: Color(0Xff23DCFF),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Row(children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xFFB7F1FF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  deference[1].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 80,
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "h",
                    style: TextStyle(
                        color: Color(0Xff23DCFF),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ]),
        Row(children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xFFB7F1FF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  deference[2].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 80,
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "m",
                    style: TextStyle(
                        color: Color(0Xff23DCFF),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ]),
    );
  }
}
