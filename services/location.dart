import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        //here we are using the await keyword so tht the function doesnt return any random value but wait until it fetches data
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
