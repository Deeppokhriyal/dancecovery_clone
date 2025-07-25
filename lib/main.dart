import 'package:dancecovery_clone/Booking_screen.dart';
import 'package:dancecovery_clone/lesson.dart';
import 'package:dancecovery_clone/map_screen.dart';
import 'package:dancecovery_clone/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    Get.offAll(() => MainScreen(initialIndex: index));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      MyMapPage(),
      Lesson(), // Replace with actual Scheduler screen
      BookingScreen(),
      ProfileScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 70,
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.blue,
            tabBackgroundColor: Colors.lightBlueAccent[100]!,
            gap: 5,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            onTabChange: _onItemTapped,
            selectedIndex: _selectedIndex,
            tabs: [
              GButton(
                icon: Icons.circle, // invisible filler
                leading: Image.asset('assets/icons/map.png', height: 26, width: 26,color: Colors.white,),
                text: 'Map',
              ),
              GButton(
                icon: Icons.circle,
                leading: Image.asset('assets/icons/video.png', height: 26, width: 26,color: Colors.white,),
                text: 'Lessons',
              ),
              GButton(
                icon: Icons.circle,
                leading: Image.asset('assets/icons/schedule.png', height: 26, width: 26,color: Colors.white,),
                text: 'Booking',
              ),
              GButton(
                icon: Icons.circle,
                leading: Image.asset('assets/icons/user.png', height: 26, width: 26,color: Colors.white,),
                text: 'Profile',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
