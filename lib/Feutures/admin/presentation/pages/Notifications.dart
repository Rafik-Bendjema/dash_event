import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notification",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Image.asset(
                    "assets/images/dash2.png",
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Content",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Color.fromARGB(255, 192, 192, 192))),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("brodcast"))
                        ],
                      ),
                    ],
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
