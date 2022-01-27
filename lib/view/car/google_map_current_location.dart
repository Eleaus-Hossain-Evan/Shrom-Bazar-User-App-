import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation(
      {Key? key, required this.longitude, required this.latitude})
      : super(key: key);
  final double? longitude;
  final double? latitude;

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  LatLng? _initialCameraPosition;
  @override
  initState() {
    _initialCameraPosition =
        LatLng(widget.latitude ?? 0.0, widget.latitude ?? 0.0);
    print("latitude eita ${widget.latitude}");
    print("longitude oita ${widget.longitude}");
    super.initState();
  }

  late final GoogleMapController _controller;
  //final Location _location = Location();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_initialCameraPosition != null)
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _initialCameraPosition!),
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller = (controller);
              _controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: _initialCameraPosition!, zoom: 15)));
            },
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
          )
      ],
    );
  }
}
