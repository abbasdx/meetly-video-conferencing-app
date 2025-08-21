import 'package:flutter/material.dart';
import 'package:meetly/screens/history_meeting_screen.dart';
import 'package:meetly/screens/meeting_screen.dart';
import 'package:meetly/screens/about_screen.dart';
import 'package:meetly/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // final AuthMethods _authMethods = AuthMethods();

  int _page = 0;  
  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  List <Widget> pages =[
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const AboutScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        // title:  const Text('Meet & Chat'),
        title: Image.asset(
          'assets/images/meetly_logo.png',
          height: 40,
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,

      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white ,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), 
            label: 'Home'
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meetings'
            ),
            
            BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About'
            )

        ]
      ),
    );
  }
  
}
