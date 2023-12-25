import 'package:dash_event/Feutures/auth/data/auth.dart';
import 'package:dash_event/Feutures/auth/singUp/presentation/pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  Auth auth = Auth();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late String email;
  late String pwd;

  void validate() async {
    if (_formkey.currentState!.validate()) {
      String? status;
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: const CircularProgressIndicator()),
              ));
      _formkey.currentState!.save();
      status = await auth.signin(email, pwd);
      Navigator.pop(context);
      if (status != null) {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                    child: Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(status!),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("back"))
                        ]),
                  ),
                )));
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              TextFormField(
                onSaved: (val) {
                  email = val!;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "this field can't be empty";
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onSaved: (val) {
                  pwd = val!;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "this field can't be empty";
                  }
                  return null;
                },
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
                  validate();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("still not having an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpView()));
                      },
                      child: const Text(
                        "sing up",
                        style: TextStyle(color: Colors.purple),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
