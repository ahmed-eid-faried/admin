

// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class PolylinesController extends GetxController {
//     late GoogleMapController mapController;

//   Map<MarkerId, Marker> markers = {};
//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();
//   String googleAPiKey = "Please provide your api key";

//   addPolyLine() {
//     PolylineId id = const PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id, color: Colors.red, points: polylineCoordinates);
//     polylines[id] = polyline;
//     // setState(() {});
//   }
//  double originLatitude = 26.48424, originLongitude = 50.04551;//START
//   double destLatitude = 26.46423, destLongitude = 50.06358;//END
//   getPolyline() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         googleAPiKey,
//         PointLatLng(originLatitude, originLongitude), //START
//         PointLatLng(destLatitude, destLongitude), //END
//         travelMode: TravelMode.driving,
//         wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//     addPolyLine();
//   }
//     addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
//     MarkerId markerId = MarkerId(id);
//     Marker marker =
//         Marker(markerId: markerId, icon: descriptor, position: position);
//     markers[markerId] = marker;
//   }

//   void onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//   }


//   @override
//   void onInit() {
//    /// origin marker
//     addMarker(LatLng(originLatitude, originLongitude), "origin",
//         BitmapDescriptor.defaultMarker);

//     /// destination marker
//     addMarker(LatLng(destLatitude, destLongitude), "destination",
//         BitmapDescriptor.defaultMarkerWithHue(90));
//     getPolyline();    super.onInit();
//   }
// }