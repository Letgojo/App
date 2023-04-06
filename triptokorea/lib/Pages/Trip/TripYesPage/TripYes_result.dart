import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String kakaoMapKey = '5157004dd04f0e8b82c4ba27aac81564';

class TripYes_result extends StatefulWidget {
  const TripYes_result({super.key});

  @override
  State<TripYes_result> createState() => _TripYes_resultState();
}

class _TripYes_resultState extends State<TripYes_result> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(35.8535156, -128.5431268);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
