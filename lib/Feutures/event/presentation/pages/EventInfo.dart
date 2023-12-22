import 'package:dash_event/Feutures/event/presentation/pages/EvnetPage.dart';
import 'package:dash_event/Feutures/event/presentation/widgets/Chatbox.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  // bool isFocus = false;
  double _containerheigh = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          const Text(
            "Dash's Code Quest Adventure",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 192, 192, 192),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
                const Text(
                  "ASK DASH",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ListView(
                      reverse: true,
                      children: [
                        ChatBox(
                          sender: "rafik",
                          content: "what is the name of the event ?",
                          isDash: false,
                        ),
                        ChatBox(
                            content:
                                "the name of the event is Dash's Code Quest Adventure",
                            sender: "Dash",
                            isDash: true),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: _containerheigh,
                  width: 360,
                  color: Color.fromARGB(255, 152, 230, 246),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(child: Text("who is dash ?"))),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 152, 230, 246),
            ),
            height: 50,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: "click to Ask Dash"),
              readOnly: true,
              onTap: () {
                setState(() {
                  if (_containerheigh == 300) {
                    _containerheigh = 0;
                  } else {
                    _containerheigh = 300;
                  }
                });
              },
            ),
          )
        ]),
      ),
    ));
  }
}
