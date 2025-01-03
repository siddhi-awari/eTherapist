import 'package:app/pages/quiz_page.dart';
import 'package:flutter/material.dart';

import '../util/bottom_nav.dart';
import 'edit_page.dart';
import 'mindEx_page.dart';
import 'noti_page.dart';
import 'profile_page.dart';
import 'therapy_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex=0;
    void navigateBottomBar(int newindex){
    setState((){
      _selectedindex=newindex;
    });
  }
  final List<Widget> _pages =[
    QuizPage(),
    MindExPage(),
    ProfilePage(),
    TherapyPage(),
    EditPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
      backgroundColor: Colors.grey,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.home_filled, color: Colors.black45),
        onPressed: () {},
      ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black45),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );

            },
          ),
        ],
    ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Rounded corners
        ),
          child: MyBottomNavBar(
            onTabChange: (index)=>navigateBottomBar(index),
          ),
        ),
      body: _pages[_selectedindex],
    );
  }
}
