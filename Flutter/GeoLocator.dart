import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/* 
Permissions : -
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
*/

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String currLocation = " ";

  fetchposition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "location is disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      Fluttertoast.showToast(msg: "location permission is denied");
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "location permission is denied forever");
    }

    Position current = await Geolocator.getCurrentPosition();
    List<Placemark> placemark = await placemarkFromCoordinates(
      current.latitude,
      current.longitude,
    );
    setState(() {
      currLocation = placemark[0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currLocation, style: TextStyle(fontSize: 20)),

              ElevatedButton(
                onPressed: () {
                  fetchposition();
                },
                child: Text("Get Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
