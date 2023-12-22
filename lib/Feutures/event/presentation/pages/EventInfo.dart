import 'package:dash_event/Feutures/event/presentation/widgets/Chatbox.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          Text(
            "Dash's Code Quest Adventure",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            width: double.maxFinite,
            child: Column(children: [
              Text(
                "ASK DASH",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ChatBox(
                sender: "rafik",
                content: "what is the name of the event ?",
                isDash: false,
              ),
              ChatBox(
                  content:
                      "the name of the event is Dash's Code Quest Adventure",
                  sender: "Dash",
                  isDash: true)
            ]),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 127, 112, 112),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            color: Colors.blue,
          )
        ]),
      ),
    ));
  }
}
