import 'package:flutter/material.dart';

class EventTime extends StatefulWidget {
  const EventTime({super.key});

  @override
  State<EventTime> createState() => _EventTimeState();
}

class _EventTimeState extends State<EventTime> {
  DateTime _time = DateTime(2024, 1, 2, 00, 00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("selected date : ${_time.toString().split(" ")[0]}"),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? time;
                        time = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)));
                        if (time != null) {
                          setState(() {
                            _time = time!;
                          });
                        }
                      },
                      child: const Text("edit"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("selected time : ${_time.toString().split(" ")[1]}"),
                  ElevatedButton(
                      onPressed: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },
                      child: const Text("edit"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
