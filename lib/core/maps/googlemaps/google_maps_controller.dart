import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController extends GetxController {
  late GoogleMapController gmc;
  final loading = true.obs;

  final kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  ).obs;
  late MarkerId yourLocationMarker;

  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final getLatLng = const LatLng(0, 0).obs;
  final getZoomLevel = 0.0.obs;
  final getVisibleRegion =
      LatLngBounds(northeast: const LatLng(0, 0), southwest: const LatLng(0, 0))
          .obs;
  final getScreenCoordinate = const ScreenCoordinate(x: 0, y: 0).obs;

  StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream().listen((Position? position) {
    print(position == null
        ? 'Unknown'
        : '${position.latitude.toString()}, ${position.longitude.toString()}');
  });

  void moveCamera() {
    final latLng = LatLng(latitude.value, longitude.value);
    gmc.moveCamera(CameraUpdate.newLatLng(latLng));
  }

  void animateCamera() {
    final latLng = LatLng(latitude.value, longitude.value);
    gmc.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void animateNewCameraPosition() {
    final latLng = LatLng(latitude.value, longitude.value);
    gmc.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: 8),
    ));
  }

  void getLatLngOfCenter() async {
    final LatLngBounds visibleRegion = await gmc.getVisibleRegion();
    final double centerLatitude =
        (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) /
            2;
    final double centerLongitude = (visibleRegion.northeast.longitude +
            visibleRegion.southwest.longitude) /
        2;
    getLatLng.value = LatLng(centerLatitude, centerLongitude);
  }

  void getZoomLevelfun() async {
    getZoomLevel.value = await gmc.getZoomLevel();
  }

  void getVisibleRegionfun() async {
    getVisibleRegion.value = await gmc.getVisibleRegion();
  }

  void getScreenCoordinatefun() async {
    final latLng = LatLng(latitude.value, longitude.value);
    getScreenCoordinate.value = await gmc.getScreenCoordinate(latLng);
  }

  @override
  void onInit() {
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      changeMarker(position!.latitude, position.longitude);
      // print(position == null
      //     ? 'Unknown'
      //     : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
    super.onInit();
    initializeMap();
  }

  void initializeMap() async {
    final position = await Geolocator.getCurrentPosition();
    kGooglePlex.value = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
    loading.value = false;
  }

  Set<Marker> markerList = {};
  changeMarker(latitude, longitude) async {
    markerList.clear();
    // markerList.removeWhere((element) => element.markerId == yourLocationMarker);
    markerList.add(
      Marker(
          markerId: MarkerId("${markerList.length}"),
          position: LatLng(latitude, longitude),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration.empty, "images/placeholder.png")),
    );
    gmc.animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
  }

  addYourLocationMarker() async {
    Position position = await Geolocator.getCurrentPosition();
    yourLocationMarker = MarkerId("${markerList.length}");
    markerList.add(
      Marker(
          markerId: MarkerId("${markerList.length}"),
          position: LatLng(position.latitude, position.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration.empty, "images/placeholder.png")),
    );
  }

  removeYourLocationMarker() {
    markerList.removeWhere((element) => element.markerId == yourLocationMarker);
  }
}
