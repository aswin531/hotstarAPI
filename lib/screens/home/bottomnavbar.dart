import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotstar/new&hot/newandhot.dart';
import 'package:hotstar/screens/downloads/downloads.dart';
import 'package:hotstar/screens/home/homeappbar.dart';
import 'package:hotstar/screens/myspace/myspace.dart';
import 'package:hotstar/screens/search/search.dart';
import 'package:hotstar/utils/colors.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    NewandHotScreen(),
    DownloadsScreen(),
    MySpaceScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: lightblack,
        selectedItemColor: lightwhite,
        unselectedItemColor: grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: grey,
              size: 20,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: grey,
              size: 20,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bolt_outlined,
              color: grey,
              size: 20,
            ),
            label: "New & Hot",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.download,
              color: grey,
              size: 20,
            ),
            label: "Downloads",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.circleUser,
              color: grey,
              size: 20,
            ),
            label: "My Space",
          ),
        ],
        onTap: (int newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
      ),
    );
  }
}
