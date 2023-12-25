import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_event/Feutures/admin/presentation/widgets/AddQuestion.dart';
import 'package:dash_event/Feutures/event/domain/entities/EventQuestion.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Questions",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/dash3.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const Dialog(
                            child: AddQuestion(),
                          ),
                        );
                      },
                      child: const Text("add"),
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('questions')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<EventQuestion> questions = snapshot.data!.docs
                          .map((doc) => EventQuestion(
                              question: doc['question'] as String,
                              answer: doc['answer'] as String))
                          .toList();

                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: questions.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 224, 224, 224),
                                ),
                                padding: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width * 0.80,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        questions[index].question,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: SizedBox(
                                              width: 300,
                                              height: 300,
                                              child: Column(
                                                children: [
                                                  Text(questions[index]
                                                      .question),
                                                  Text(questions[index].answer),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.info),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
