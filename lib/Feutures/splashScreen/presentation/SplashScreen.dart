import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dash_event/widget_tree.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    fading();
  }

  void fading() async {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (mounted) {
        setState(() {
          _opacity = 1;
        });
      }

      Future.delayed(const Duration(seconds: 4)).then((value) {
        if (mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WidgetTree()));
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFE3FFFA)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                  duration: const Duration(seconds: 3),
                  opacity: _opacity,
                  child: Image.asset(
                    'assets/images/dash.png',
                    height: 250,
                  )),
              const SizedBox(
                height: 50,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 55, 55)),
                child: AnimatedTextKit(
                  repeatForever: false,
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      "Dash Events",
                      speed: const Duration(milliseconds: 200),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
