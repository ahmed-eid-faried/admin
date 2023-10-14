import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main(List<String> args) {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("GOOGLE maps")),
        body: const Maps(),
      ),
    );
  }
}

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  late GoogleMapController gmc;
  // static CameraPosition _kGooglePlex = const CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  late CameraUpdate cameraUpdate;
  double latitude = 0;
  double longitude = 0;
  LatLng latLng = const LatLng(0, 0);
  LatLng getLatLng = const LatLng(0, 0);
  double getZoomLevell = 0;
  LatLngBounds? getVisibleRegionl;
  ScreenCoordinate? getScreenCoordinatek;
  static CameraPosition? _kGooglePlex;
  Future<Position> getpositionP() async {
    Position xy = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(xy.latitude, xy.longitude),
      zoom: 14.4746,
    );

    return xy;
  }

// Create a function to retrieve the center coordinates
  Future<LatLng> getCenterCoordinates() async {
    final LatLngBounds visibleRegion = await gmc.getVisibleRegion();
    final double centerLatitude =
        (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) /
            2;
    final double centerLongitude = (visibleRegion.northeast.longitude +
            visibleRegion.southwest.longitude) /
        2;
    return LatLng(centerLatitude, centerLongitude);

    // // Return a default LatLng if the map controller is null
    // return const LatLng(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _kGooglePlex == null
              ? Container(
                  color: Colors.greenAccent,
                  height: 300,
                  width: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex!,
                    onMapCreated: (GoogleMapController controller) {
                      // _controller.complete(controller);
                      gmc = controller;
                    },
                  ),
                )
              : const CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  onChanged: (x) {
                    latitude = double.tryParse(x) ?? 0.0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Latitude')),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  onChanged: (x) {
                    longitude = double.tryParse(x) ?? 0.0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Longitude')),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                latLng = LatLng(latitude, longitude);
                gmc.moveCamera(CameraUpdate.newLatLng(latLng));
              },
              child: const Text("moveCamera TO")),
          ElevatedButton(
              onPressed: () {
                LatLng latLng = LatLng(latitude, longitude);
                gmc.animateCamera(CameraUpdate.newLatLng(latLng));
              },
              child: const Text("animateCamera TO")),
          ElevatedButton(
              onPressed: () {
                LatLng latLng = LatLng(latitude, longitude);
                gmc.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target: latLng, zoom: 8, tilt: 45, bearing: 45)));
              },
              child: const Text("animate newCameraPosition")),
          ElevatedButton(
              onPressed: () async {
                LatLng latLng = await getCenterCoordinates();
                getLatLng = await gmc.getLatLng(ScreenCoordinate(
                    x: latLng.latitude.round(), y: latLng.longitude.round()));
                setState(() {});
              },
              child: const Text("getLatLng of center my map")),
          Text("getLatLng:-  $getLatLng"),
          ElevatedButton(
              onPressed: () async {
                getZoomLevell = await gmc.getZoomLevel();
                setState(() {});
              },
              child: const Text("getLatLng of center my map")),
          Text("getZoomLevel:-  $getZoomLevell"),
          ElevatedButton(
              onPressed: () async {
                getVisibleRegionl = await gmc.getVisibleRegion();
                setState(() {});
              },
              child: const Text("getLatLng of center my map")),
          Text("getVisibleRegion:-  $getVisibleRegionl"),
          ElevatedButton(
              onPressed: () async {
                getScreenCoordinatek = await gmc.getScreenCoordinate(latLng);
                setState(() {});
              },
              child: const Text("getLatLng of center my map")),
          Text(
              "getScreenCoordinate for latLng (above):-  $getScreenCoordinatek"),
        ],
      ),
    );
  }
}
