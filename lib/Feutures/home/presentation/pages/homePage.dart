import 'package:dash_event/Feutures/event/presentation/pages/EvnetPage.dart';
import 'package:dash_event/Feutures/event/presentation/pages/EventInfo.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildscreens() {
    return [const EventPage(), const EventInfo()];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildscreens(),
      backgroundColor: const Color.fromARGB(255, 152, 230, 246),
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "home",
            activeColorPrimary: Colors.white,
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.info),
            title: "info",
            activeColorPrimary: Colors.white,
            inactiveColorPrimary: Colors.grey),
      ],
      navBarStyle: NavBarStyle.style1,
    );
  }
}
