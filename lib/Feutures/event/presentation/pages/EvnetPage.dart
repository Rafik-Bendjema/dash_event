import 'package:dash_event/Feutures/event/presentation/widgets/CountDown.dart';
import 'package:dash_event/Feutures/event/presentation/widgets/NotificationField.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Container(
                child: Center(
                  child: Container(
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.yellow),
                  ),
                ),
                height: 50,
                width: 100,
                //  padding: EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 179, 179, 179),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Image.asset(
            'assets/images/dash.png',
            height: 250,
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Text(
                "Dash",
                style: TextStyle(color: Color(0Xff23DCFF), fontSize: 36),
              ),
              Text(
                "is starting the event in",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              child: CountDown()),
          SizedBox(
            height: 15,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              child: NotioficationField()),
          Expanded(
              child: Center(
            child: Container(
              height: 70,
              child: ElevatedButton(
                child: Text(
                  "sing out",
                  style: TextStyle(fontSize: 20, color: Color(0Xff23DCFF)),
                ),
                onPressed: () {},
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
