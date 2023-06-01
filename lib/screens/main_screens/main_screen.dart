import 'package:flutter/material.dart';
import 'package:our_gazipur/utils/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex=0;


  void _onItemTapped(value){
    setState(() {
      _selectedIndex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
        elevation: 8.0,
        items:  const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'GCC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Complains',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'others',
          ),
        ],
        selectedItemColor: const Color(0xFF025C31),
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
    );
  }
}