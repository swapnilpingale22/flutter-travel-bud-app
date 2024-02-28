import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/address.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';

class LocationScreen extends StatefulWidget {
  static const String routeName = '/location';
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double latitude = 18.5304;
  double longitude = 73.8567;

  @override
  void initState() {
    super.initState();
    // showlocationbox();
  }

  showlocationbox() {
    Timer(const Duration(seconds: 2), () {
      showLocationDialog(context);
    });
  }

  late GoogleMapController mapController;

  late Marker userLocationMarker = Marker(
    markerId: const MarkerId('user_location'),
    position: LatLng(latitude, longitude),
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void updateLocationProvider() {
    var homestayProvider = Provider.of<HomestayProvider>(
      context,
      listen: false,
    );
    homestayProvider.updateLocation(
      lat: latitude,
      long: longitude,
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _updateLocation() async {
    try {
      Position position = await _determinePosition();
      setState(() {
        // initLocation = LatLng(position.latitude, position.longitude);
        latitude = position.latitude;
        longitude = position.longitude;
        userLocationMarker = Marker(
          markerId: const MarkerId('user_location'),
          position: LatLng(latitude, longitude),
          infoWindow: const InfoWindow(
            title: 'Your Location',
            snippet: 'This is your current location',
          ),
        );
      });
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomStepper(index: 5),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 12,
            ),
            zoomControlsEnabled: false,
            onTap: (newLocation) {
              setState(() {
                latitude = newLocation.latitude;
                longitude = newLocation.longitude;
              });
              print('New Lat: ${latitude} & Long: ${longitude}');
            },
            markers: {
              Marker(
                markerId: const MarkerId('1'),
                position: LatLng(latitude, longitude),
                infoWindow: const InfoWindow(
                    title: 'This will be your property location'),
              )
            },
          ),
          Container(
            height: 40,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white60,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),
                Text(' 88 Edgefield Drive Broklyn, NY 11215'),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    text: 'Next',
                    onTap: () {
                      updateLocationProvider();
                      Navigator.pushNamed(
                        context,
                        AddresssScreen.routeName,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                _updateLocation();
              },
              child: const Icon(Icons.my_location_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
