// import 'package:adminapp/core/maps/polylines/polylines_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Polyline example',
//       home: MapScreen(),
//     );
//   }
// }

// //
// class MapScreen extends GetView<PolylinesController> {
//   const MapScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//             target:
//                 LatLng(controller.originLatitude, controller.originLongitude),
//             zoom: 15),
//         myLocationEnabled: true,
//         tiltGesturesEnabled: true,
//         compassEnabled: true,
//         scrollGesturesEnabled: true,
//         zoomGesturesEnabled: true,
//         onMapCreated: controller.onMapCreated,
//         markers: Set<Marker>.of(controller.markers.values),
//         polylines: Set<Polyline>.of(controller.polylines.values),
//       )),
//     );
//   }
// }
