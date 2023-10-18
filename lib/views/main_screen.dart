import 'package:flutter/material.dart';
import 'package:flutter_plant_app/dashboard.dart';
import 'package:flutter_plant_app/shared/assets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey[800],
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/home.png"),
                color: Color(0xFF3A5A98),
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/home.png"),
                color: Colors.green,
              ),
              label: 'Home'
              // Text(
              //   'Home',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w400,
              //     fontSize: 16,
              //     fontFamily: "OpenSans",
              //   ),
              // ),
              ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/garden.png"),
              color: Color(0xFF3A5A98),
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/garden.png"),
              color: Colors.green,
            ),
            // title: Text(
            //   'Garden',
            //   style: TextStyle(
            //     fontWeight: FontWeight.w400,
            //     fontSize: 16,
            //     fontFamily: "OpenSans",
            //   ),
            // ),
            label: 'Garden',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/search.png"),
                color: Color(0xFF3A5A98),
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/search.png"),
                color: Colors.green,
              ),
              label: 'Cari'
              // Text(
              //   'Cari',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w400,
              //     fontSize: 16,
              //     fontFamily: "OpenSans",
              //   ),
              // ),
              ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/profile.png"),
                color: Color(0xFF3A5A98),
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/profile.png"),
                color: Colors.green,
              ),
              label: 'Profile'
              // Text(
              //   'Profile',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w400,
              //     fontSize: 12,
              //     fontFamily: "OpenSans",
              //   ),
              // ),
              ),
        ],
      ),
      body: pageRouters(_selectedIndex),
    );
  }

  pageRouters(int index) {
    switch (index) {
      case 0:
        return Dashboard();
      case 1:
        return Dashboard();
      case 2:
        return Dashboard();
      case 3:
        return Dashboard();
      default:
        return Dashboard();
    }
  }
}
