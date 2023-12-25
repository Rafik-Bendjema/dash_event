import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_event/Feutures/admin/presentation/pages/adminView.dart';
import 'package:dash_event/Feutures/auth/singIn/presentation/pages/SignIn.dart';
import 'package:dash_event/Feutures/auth/singUp/presentation/pages/SignUp.dart';
import 'package:dash_event/Feutures/event/presentation/pages/EvnetPage.dart';
import 'package:dash_event/Feutures/home/presentation/pages/homePage.dart';
import 'package:dash_event/Feutures/splashScreen/presentation/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<bool> isAdmin() async {
    User? user = await Auth().getCurrentUser();

    if (user != null) {
      // Fetch user data from Firestore or another source
      // Example assumes 'users' collection in Firestore
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      // Check if the user is an admin based on the 'isadmin' field
      bool isUserAdmin = userDoc.data()?['isadmin'] ?? false;

      return isUserAdmin;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;

          if (user != null) {
            return FutureBuilder<bool>(
              future: isAdmin(),
              builder: (context, adminSnapshot) {
                if (adminSnapshot.connectionState == ConnectionState.done) {
                  bool isUserAdmin = adminSnapshot.data ?? false;

                  if (isUserAdmin) {
                    return const AdminView();
                  } else {
                    return const EventPage();
                  }
                } else {
                  // Loading admin status
                  return const Splash();
                }
              },
            );
          } else {
            // User is not logged in, show SignInView
            return const SignInView();
          }
        } else {
          // Connection is still in progress, show Splash
          return const Splash();
        }
      },
    );
  }
}
