import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final geoLocator= Geolocator.getCurrentPosition(
    forceAndroidLocationManager: true
  );
   Position? _currentPosition;
  String _currentAddress = "";
  void getCurrentLoction() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position){
      setState(() {
        _currentPosition= position;
      });
      _getAddressFromLatLng();
    } ).catchError((e){
      print(e);
    });
  }

  void getAddressFromLatLng() async{
    try{
      List<Placemark> p = await placemarkFromCoordinates(_currentPosition!.latitude, _currentPosition!.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress = "${place.name}, ${place.subLocality}";
      });
    }catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentAddress != null && _currentPosition !=null) Text(_currentAddress),
            ElevatedButton(
              child: Text("Get location"),
              onPressed: () {
                getCurrentLoction;
                print(_currentPosition);
                print("hello");
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
