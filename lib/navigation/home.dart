import 'package:flutter/material.dart';
import 'package:milton_app/widgets/home.dart';
import 'package:milton_app/widgets/splash_screen.dart';
import 'package:milton_app/modules/home/screens/home.dart';
import 'package:milton_app/modules/reservetions/screens/reservetions.dart';
import 'package:milton_app/modules/top/screens/top.dart';
import 'package:milton_app/modules/profile/screens/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    MyWidget(),
    ReservationsWidget(),
    TopWidget(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
