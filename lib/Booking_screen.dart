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
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.deepPurple[300],
            indicatorColor: Colors.deepPurple[300],
            tabs: [
              Tab(
                child: Text(
                  'Bookings',
                  style: TextStyle(
                    fontFamily: 'sans-serif-thin', // Set your regular font
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Passes',
                  style: TextStyle(
                    fontFamily: 'sans-serif-thin', // Set your regular font

                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                'No Bookings found',
                style: TextStyle(
                  fontFamily: 'sans-serif-thin', // Set your regular font
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: Text(
                'Not any passes purchased',
                style: TextStyle(
                  fontFamily: 'sans-serif-thin', // Set your regular font
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
