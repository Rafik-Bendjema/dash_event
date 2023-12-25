import 'package:dash_event/Feutures/auth/data/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                try {
                  Auth().createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      name: fullNameController.text.trim());
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: Column(children: [
                                    const Text("weak password"),
                                    SizedBox(
                                      height: 10,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("back")),
                                    )
                                  ]),
                                ),
                              ),
                            ));
                  } else if (e.code == 'email-already-in-use') {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: Column(children: [
                                    const Text("email already taken"),
                                    SizedBox(
                                      height: 10,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("back")),
                                    )
                                  ]),
                                ),
                              ),
                            ));
                  }
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Column(children: [
                                  Text(e.toString()),
                                  SizedBox(
                                    height: 10,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("back")),
                                  )
                                ]),
                              ),
                            ),
                          ));
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
