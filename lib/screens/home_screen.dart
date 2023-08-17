import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarkers(); // Add bus stop markers here
  }

  void _addMarkers() {
    _markers.add(
      Marker(
        markerId: const MarkerId('busStop1'),
        position: const LatLng(37.7749, -122.4194), // Example coordinates
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: const InfoWindow(title: 'Bus Stop 1'),
      ),
      // Add more markers as needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map coordinates
          zoom: 15,
        ),
        markers: _markers,
        myLocationEnabled: true,
      ),
    );
  }
}
