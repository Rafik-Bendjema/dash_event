import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  void _validate() {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      // Use the FirebaseFirestore instance to add a new document to the 'questions' collection
      FirebaseFirestore.instance.collection('questions').add({
        'question': _questionController.text,
        'answer': _answerController.text,
      });

      // Close the dialog after adding the question
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _globalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Question",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: _questionController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "This field can't be empty";
                }
                return null;
              },
              maxLines: 4,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 188, 188, 188),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Answer",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: _answerController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "This field can't be empty";
                }
                return null;
              },
              maxLines: 4,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 188, 188, 188),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(onPressed: _validate, child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}
