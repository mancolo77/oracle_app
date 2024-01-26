import 'package:flutter/material.dart';
import 'package:oracle_app_2/empty/empty.dart';
import 'package:oracle_app_2/main_page/main_screen.dart';
import 'package:oracle_app_2/profile_page/profile_page.dart';
import 'package:oracle_app_2/search_page/search_screen.dart';
import '../chat_page/main_chat_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final screens = [
    const HomePage(),
    const SearchPage(),
    const EmptyPage(),
    const MainChatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          elevation: 0,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/new.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/search.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/new-1.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Comment.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/bell.png'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}