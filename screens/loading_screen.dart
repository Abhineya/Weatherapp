import 'dart:js';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

const apiKey = '7083585b9ec5c68adc08dc061349d535';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// void getLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//       //here we are using the await keyword so tht the function doesnt return
//       desiredAccuracy: LocationAccuracy
//           .low); //any random value but wait until it fetches data
//   print(position);
// }
//
// void grantPermission() async {
//   try {
//     LocationPermission permission = await Geolocator.requestPermission();
//     print(permission);
//   } catch (e) {
//     print(e);
//   }
// }

class _LoadingScreenState extends State<LoadingScreen> {
  var latitude;
  var longitude;

  // get decodedData => null;

  @override
  initState() {
    super.initState();
    print("initstate called ");
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    latitude = (location.latitude);
    longitude = (location.longitude);
    print(longitude);

    var weatherData = await networkHelper.getData();
    Navigator.push(
      this.context,
      MaterialPageRoute(builder: (context) => LocationScreen()),
    );

    @override
    void deactivate() {
      super.deactivate();
      print("Deactivated");
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () {},
            child: Text('Get Location'),
          ),
        ),
      );
    }
  }
}
