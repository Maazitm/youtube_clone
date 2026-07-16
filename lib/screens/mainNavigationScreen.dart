import 'package:flutter/material.dart';
import 'package:youtube/screens/homeScreen.dart';
import 'package:youtube/screens/shortsScreen.dart';
import 'package:youtube/screens/uploadVideoScreen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // List of screens that the navigation bar will switch between
  final List<Widget> _screens = [
    const HomeScreen(),
    const ShortsScreen(),
    const UploadVideoScreen(),
    const Center(child: Text('Subscriptions Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    // If the current index is 1 (Shorts), we want a black theme. Otherwise, white.
    final bool isShortsScreen = _currentIndex == 1;

    return Scaffold(
      backgroundColor: isShortsScreen ? Colors.black : Colors.white,

      // Displays the current screen from the list
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: isShortsScreen ? Colors.black : Colors.white,
        selectedItemColor: isShortsScreen ? Colors.white : Colors.black,
        unselectedItemColor: isShortsScreen ? Colors.white70 : Colors.black54,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            activeIcon: Icon(Icons.play_circle_filled),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 38),
            activeIcon: Icon(Icons.add_circle, size: 38),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: 'You',
          ),
        ],
      ),
    );
  }
}
