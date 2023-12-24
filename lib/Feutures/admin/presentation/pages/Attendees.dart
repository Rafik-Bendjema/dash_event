import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Attendees extends StatefulWidget {
  const Attendees({super.key});

  @override
  State<Attendees> createState() => _AttendeesState();
}

class _AttendeesState extends State<Attendees> {
  final List<String> Attendees =
      List.generate(50, (index) => faker.person.name());

  final int _nbAtt = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Attendees",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/dash.png",
                  height: 100,
                ),
                RichText(
                    text: TextSpan(
                        text: Attendees.length.toString(),
                        style: const TextStyle(
                            color: Color(0Xff23DCFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        children: const <TextSpan>[
                      TextSpan(
                          text: ' is joining Dash',
                          style: TextStyle(
                              color: Color.fromARGB(255, 50, 50, 50),
                              fontSize: 20))
                    ])),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling
                    shrinkWrap: true,
                    itemCount: Attendees.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 224, 224, 224)),
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    Attendees[index],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.info))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
