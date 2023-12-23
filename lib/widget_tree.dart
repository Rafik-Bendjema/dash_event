import 'package:dash_event/Feutures/auth/singUp/presentation/pages/SignUp.dart';
import 'package:dash_event/Feutures/home/presentation/pages/homePage.dart';
import 'package:dash_event/Feutures/splashScreen/presentation/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:dash_event/Feutures/auth/data/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return SignUpView();
          }
        } else {
          return const Splash();
        }
      },
    );
  }
}
