// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   GoogleMapController? _controller;
//
//   final CameraPosition _initialPosition =
//   CameraPosition(target: LatLng(28.6139, 77.2090), zoom: 12);
//
//   final List<Marker> markers = [];
//
//   void addMarker(LatLng coordinate) {
//     int id = Random().nextInt(100);
//
//     setState(() {
//       markers.add(Marker(
//         position: coordinate,
//         markerId: MarkerId(id.toString()),
//       ));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: _initialPosition,
//         mapType: MapType.normal,
//         onMapCreated: (controller) {
//           _controller = controller;
//         },
//         markers: markers.toSet(),
//         onTap: (coordinate) {
//           if (_controller != null) {
//             _controller!.animateCamera(CameraUpdate.newLatLng(coordinate));
//           }
//           addMarker(coordinate);
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (_controller != null) {
//             _controller!.animateCamera(CameraUpdate.zoomOut());
//           }
//         },
//         child: Icon(Icons.zoom_out),
//       ),
//     );
//   }
// }
