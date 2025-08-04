import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DanceMapPage extends StatefulWidget {
  @override
  _DanceMapPageState createState() => _DanceMapPageState();
}

class _DanceMapPageState extends State<DanceMapPage> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(28.6139, 77.2090); // Change to your default center

  final List<Map<String, dynamic>> danceAcademies = [
    {
      'name': 'Nritya Kala Dance Academy',
      'lat': 28.6139,
      'lng': 77.2090,
      'address': 'Connaught Place, Delhi'
    },
    {
      'name': 'Taal Academy',
      'lat': 19.0760,
      'lng': 72.8777,
      'address': 'Andheri West, Mumbai'
    },
    {
      'name': 'Sanskriti Dance School',
      'lat': 12.9716,
      'lng': 77.5946,
      'address': 'Indiranagar, Bangalore'
    },
    {
      'name': 'Rhythm Academy',
      'lat': 13.0827,
      'lng': 80.2707,
      'address': 'T Nagar, Chennai'
    },
  ];

  Set<Marker> _createMarkers() {
    return danceAcademies.map((academy) {
      return Marker(
        markerId: MarkerId(academy['name']),
        position: LatLng(academy['lat'], academy['lng']),
        infoWindow: InfoWindow(
          title: academy['name'],
          snippet: academy['address'],
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            markers: _createMarkers(),
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          // Search Bar
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Filter Buttons
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("Style"),
                _buildFilterButton("Price"),
              ],
            ),
          ),

          // Current Location Button
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                // Add location centering logic
              },
              child: Icon(Icons.my_location, color: Colors.white),
            ),
          ),

          // Bottom Info Bar
          // Positioned(
          //   bottom: 40,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(25),
          //         boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
          //       ),
          //       child: Text(
          //         "11 dance schools in this area",
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12)],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(label),
          items: ['Option 1', 'Option 2']
              .map((e) => DropdownMenuItem(child: Text(e), value: e))
              .toList(),
          onChanged: (val) {},
        ),
      ),
    );
  }
}
