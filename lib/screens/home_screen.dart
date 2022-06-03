import 'package:flutter/material.dart';
import 'package:imwell/constants.dart';
import 'package:imwell/navigation_drawer.dart';
import 'package:imwell/screens/map_view.dart';
import 'package:imwell/screens/profile.dart';
import 'package:imwell/screens/statistics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = <Widget>[
    Statistics(),
    mapView(),
    Profile()

    //const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Welcome Back"),
        ),
        backgroundColor: kPrimaryColor,
      ),
      drawer: const NavigationDrawer(),
      body: Center(
        child: _screens.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        selectedIconTheme: const IconThemeData(color: kPrimaryColor, size: 25),
        selectedItemColor: kPrimaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(
          color: kPrimaryAccentColor,
        ),
        unselectedItemColor: kPrimaryAccentColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
