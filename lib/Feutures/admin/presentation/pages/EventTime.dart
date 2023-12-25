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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("selected time : ${_time.toString().split(" ")[1]}"),
                  ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? timing;
                        timing = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        print("this is the time choosing ${timing.toString()}");
                        if (timing != null) {
                          setState(() {
                            _time =
                                DateTime(_time.year, _time.month, _time.day);
                            _time = _time.add(Duration(
                                hours: timing!.hour, minutes: timing.minute));
                            print("time after editing ${_time.toString()}");
                          });
                        }
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
