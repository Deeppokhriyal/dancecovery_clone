import 'package:dancecovery_clone/Booking_screen.dart';
import 'package:dancecovery_clone/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  final List<Widget> _pages = [
    Center(child: Text('Map Screen')),
    Center(child: Text('Lessons Screen')),
    BookingScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, index, child) {
        return WillPopScope(
          onWillPop: () async {
            if (index == 0) {
              return true;
            } else {
              _selectedIndex.value = 0;
              return false;
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(
              index: index,
              children: _pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined),
                  label: 'Lessons',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_outlined),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity_rounded),
                  label: 'Profile',
                ),
              ],
              currentIndex: index,
              selectedItemColor: Colors.deepPurple[300],
              unselectedItemColor: Colors.grey,
              onTap: (i) => _selectedIndex.value = i,
            ),
          ),
        );
      },
    );
  }
}
