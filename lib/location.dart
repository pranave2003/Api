import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _locationmessage = "";
  var a = 0;
  // ignore: unused_element
  void _getcurrentlocation() async {
    print("get");
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationmessage =
          "Latitude:${position.latitude},Longitude:${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Location")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _getcurrentlocation();
                },
                child: Text("Get location")),
          ],
        ));
  }
}
