import 'package:dash_event/Feutures/Email/data/EmailRepository.dart';
import 'package:dash_event/Feutures/Email/domain/entities/Email.dart';
import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _NotificationsState();
}

class _NotificationsState extends State<EmailPage> {
  TextEditingController textEditingController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  EmailRepo emailRepo = EmailRepoImpl();
  Future<void> validate() async {
    if (formkey.currentState!.validate()) {
      List<int> status;
      String msj;
      print("this is content ${textEditingController.text}");
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: const CircularProgressIndicator()),
              ));
      EmailRepo emailRepo = EmailRepoImpl();

      status = await emailRepo.brodcastEmail(textEditingController.text);
      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (context) => Dialog(
                  child: Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20),
                child: const Center(child: Text("Done")),
              )));
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pop(context);
      });
    }
  }

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
                  "Emails",
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
                      Form(
                        key: formkey,
                        child: Column(
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
                            TextFormField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "this field can't be empty";
                                  }
                                  return null;
                                },
                                controller: textEditingController,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 192, 192, 192))),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await validate();
                                },
                                child: const Text("brodcast"))
                          ],
                        ),
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
