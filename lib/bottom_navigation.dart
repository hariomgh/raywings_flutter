import 'package:flutter/material.dart';
import 'package:raywings_flutter/pages/home_page.dart';
import 'package:raywings_flutter/pages/ask_raywings.dart';



class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    AskRaywings(),
    LearningAnalysisScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedIconTheme: IconThemeData(size: 35),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school,
              color: Color(0xff800000),
            ),
            label: 'MyCourse',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer,
              color: Color(0xff800000),
            ),
            label: 'Ask Raywings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph,
              color: Color(0xff800000),
            ),
            label: 'Learning Analysis',
          ),
        ],
      ),
    );
  }
}

class MyCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MyCourse Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}



class LearningAnalysisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Learning Analysis Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}