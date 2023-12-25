import 'package:dash_event/Feutures/admin/presentation/pages/Attendees.dart';
import 'package:dash_event/Feutures/admin/presentation/pages/EventTime.dart';
import 'package:dash_event/Feutures/Email/presentation/pages/EmailPage.dart';
import 'package:dash_event/Feutures/admin/presentation/pages/Questions.dart';
import 'package:dash_event/Feutures/admin/presentation/widgets/AdminTile.dart';
import 'package:dash_event/Feutures/auth/data/auth.dart';
import 'package:dash_event/Feutures/event/presentation/pages/EvnetPage.dart';
import 'package:dash_event/Feutures/event/presentation/widgets/CountDown.dart';
import 'package:flutter/material.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(255, 43, 43, 43) : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dash view",
                  style: TextStyle(fontSize: 30, color: Color(0xFF23DCFF)),
                ),
                GestureDetector(
                  onTap: () async {
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
                              : const Color.fromARGB(255, 145, 140, 140),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
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
                            decoration: const BoxDecoration(
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  AdminTile(
                      image: "dash5.png",
                      title: "event time",
                      inclick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EventTime()));
                      }),
                  AdminTile(
                      image: "dash2.png",
                      title: "Emails",
                      inclick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmailPage()));
                      }),
                  AdminTile(
                      image: "dash3.png",
                      title: "attendees",
                      inclick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Attendees()));
                      }),
                  AdminTile(
                      image: "dash4.png",
                      title: "questions",
                      inclick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Questions()));
                      }),
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  "Dash",
                  style: TextStyle(color: Color(0Xff23DCFF), fontSize: 30),
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
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                child: const CountDown()),
            Expanded(
                child: Center(
              child: SizedBox(
                height: 70,
                child: ElevatedButton(
                  child: const Text(
                    "sing out",
                    style: TextStyle(fontSize: 20, color: Color(0Xff23DCFF)),
                  ),
                  onPressed: () async {
                    await Auth().signOut();
                  },
                ),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
