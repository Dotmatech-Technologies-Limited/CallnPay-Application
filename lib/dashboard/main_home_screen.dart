import 'package:flutter/material.dart';

import 'accounts_screen.dart';
import 'home.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedTab = 0;
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    AccountsScreen(),
    //ProfilePage(),
  ];
  void _onTapItem(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedTab),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          selectedItemColor: Colors.indigo[900],
          selectedIconTheme: IconThemeData(color: Colors.indigo[900]),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card_sharp), label: "Accounts"),
            BottomNavigationBarItem(icon: Icon(Icons.file_copy_rounded), label: "Utilities"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: "Profile"),
          ],
          currentIndex: _selectedTab,
          onTap: _onTapItem,
        ),
      ),
    );
  }
}
