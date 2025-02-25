import 'package:duo_case_one/screens/home_page.dart';
import 'package:duo_case_one/screens/add_post_page.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_bottom_nav_bar.dart'; // Import the custom widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Bottom Nav Bar',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'PPTelegraf',
          scaffoldBackgroundColor: Colors.white),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages corresponding to each navigation bar item
  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('News Page', style: TextStyle(fontSize: 24))),
    AddPostPage(),
    const Center(child: Text('Polls Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          CustomBottomNavBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          CustomBottomNavBarItem(
            icon: Icon(Icons.announcement),
            label: 'News',
          ),
          CustomBottomNavBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          CustomBottomNavBarItem(
            icon: Icon(Icons.poll),
            label: 'Polls',
          ),
          CustomBottomNavBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
