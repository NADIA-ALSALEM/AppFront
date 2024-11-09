import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  // Set the initial position to your desired location
  final LatLng _initialPosition = const LatLng(37.7749, -122.4194);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Points'),
        backgroundColor: const Color(0xff3E9C8F),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12,
        ),
        markers: {
          // Add example markers for donation points
          const Marker(
            markerId: MarkerId('donationPoint1'),
            position: LatLng(37.7749, -122.4194), // Example coordinates
            infoWindow: InfoWindow(title: 'Donation Point 1'),
          ),
          const Marker(
            markerId: MarkerId('donationPoint2'),
            position: LatLng(37.7849, -122.4294), // Example coordinates
            infoWindow: InfoWindow(title: 'Donation Point 2'),
          ),
        },
      ),
    );
  }
}