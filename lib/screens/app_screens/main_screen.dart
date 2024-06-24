import 'package:flutter/material.dart';

import 'home_screens.dart';
import 'my_profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const MainScreenExample(),
    );
  }
}

class MainScreenExample extends StatefulWidget {
  const MainScreenExample({super.key});

  @override
  State<MainScreenExample> createState() => _MainScreenExampleState();
}

class _MainScreenExampleState extends State<MainScreenExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color.fromRGBO(255, 51, 119, 1),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Badge(child: Icon(Icons.home_outlined)),
            label: 'Домой',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.people_alt),
            icon: Badge(child: Icon(Icons.people_alt_outlined)),
            label: 'Я',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          // shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: HomeScreen(),
        ),

        /// Notifications page

        Card(
          child: MyProfileScreen(),
          margin: const EdgeInsets.all(8.0),
          // shadowColor: Colors.transparent,
        ),

        /// Messages page
      ][currentPageIndex],
    );
  }
}
