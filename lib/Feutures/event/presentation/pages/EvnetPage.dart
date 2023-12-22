import 'package:dash_event/Feutures/event/presentation/widgets/CountDown.dart';
import 'package:dash_event/Feutures/event/presentation/widgets/NotificationField.dart';
import 'package:flutter/material.dart';

bool isDark = false;

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(255, 43, 43, 43) : Colors.white,
      body: SafeArea(
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDark = !isDark;
                  });
                },
                child: Stack(children: [
                  Container(
                    height: 50,
                    width: 100,
                    //  padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: isDark
                            ? Colors.black
                            : Color.fromARGB(255, 145, 140, 140),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    width: 25,
                    height: 25,
                    top: 11,
                    left: isDark ? 50 : 5,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned(
                        width: 25,
                        height: 25,
                        left: 10,
                        child: Container(
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.yellow),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  isDark ? Colors.black : Colors.transparent),
                        ),
                      )
                    ]),
                  ),
                ]),
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
                style: TextStyle(
                    fontSize: 20,
                    color: isDark
                        ? const Color.fromARGB(255, 197, 197, 197)
                        : const Color.fromARGB(255, 63, 63, 63)),
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
