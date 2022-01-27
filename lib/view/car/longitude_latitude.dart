import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'google_map_current_location.dart';

class LongitudeLatitude extends StatefulWidget {
  const LongitudeLatitude({Key? key}) : super(key: key);

  @override
  _LongitudeLatitudeState createState() => _LongitudeLatitudeState();
}

class _LongitudeLatitudeState extends State<LongitudeLatitude> {
  Location location = Location();
  LocationData? _currentPosition;
  double? v1;
  double? v2;
  bool _isLoading = false;
  Future<void> getLocationPermission() async {
    _isLoading = true;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();

    v1 = _currentPosition?.latitude;
    v2 = _currentPosition?.longitude;

    print("Location Latitude $v1");
    print("Location Longitude$v2");
    _isLoading = false;
    return;
  }

  @override
  void initState() {
    getLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator()
        : CurrentLocation(
            latitude: v1,
            longitude: v2,
          );
  }
}
