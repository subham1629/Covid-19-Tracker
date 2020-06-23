import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:myapp/api.dart';
import 'package:myapp/page/homeScreen.dart';

class bottomBar extends StatefulWidget {
  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  final List _screens = [homeScreen(), api()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.blue,
          selectedItemBackgroundColor: Colors.lightBlueAccent,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: _currentIndex,
        onSelectTab: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.flag,
            label: 'Country',
          ),
        ],
      ),
    );
  }
}
