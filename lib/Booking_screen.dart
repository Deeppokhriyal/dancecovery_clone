import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.deepPurple[300],
            indicatorColor: Colors.deepPurple[300],
            tabs: [
              Tab(text: 'Bookings'),
              Tab(text: 'Passes'),
            ],
          ),
        ),
        body:TabBarView(
          children: [
            Tab(text: 'No Bookings found'),
            Tab(text: 'Not any passes purchased',)


          ],
        ),
      ),
    );
  }
}

