import 'package:adminapp/core/maps/googlemaps/google_maps_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class Maps extends GetView<MapsController> {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            if (controller.loading.value) {
              return const CircularProgressIndicator();
            } else {
              return GMap(controller: controller);
            }
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  onChanged: (x) {
                    controller.latitude.value = double.tryParse(x) ?? 0.0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Latitude')),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  onChanged: (x) {
                    controller.longitude.value = double.tryParse(x) ?? 0.0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Longitude')),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              controller.addYourLocationMarker();
            },
            child: const Text("Live location"),
          ),
          ElevatedButton(
            onPressed: () async {
              controller.removeYourLocationMarker();
            },
            child: const Text("remove Your Live location"),
          ),
          ElevatedButton(
            onPressed: () {
              controller.moveCamera();
            },
            child: const Text("moveCamera TO"),
          ),
          ElevatedButton(
            onPressed: () {
              controller.animateCamera();
            },
            child: const Text("animateCamera TO"),
          ),
          ElevatedButton(
            onPressed: () {
              controller.animateNewCameraPosition();
            },
            child: const Text("animate newCameraPosition"),
          ),
          ElevatedButton(
            onPressed: () {
              controller.getLatLngOfCenter();
            },
            child: const Text("getLatLng of center my map"),
          ),
          Obx(() {
            return Text("getLatLng:-  ${controller.getLatLng.value}");
          }),
          ElevatedButton(
            onPressed: () {
              controller.getZoomLevel();
            },
            child: const Text("getZoomLevel of center my map"),
          ),
          Obx(() {
            return Text("getZoomLevel:-  ${controller.getZoomLevel.value}");
          }),
          ElevatedButton(
            onPressed: () {
              controller.getVisibleRegion();
            },
            child: const Text("getVisibleRegion of center my map"),
          ),
          Obx(() {
            return Text(
                "getVisibleRegion:-  ${controller.getVisibleRegion.value}");
          }),
          ElevatedButton(
            onPressed: () {
              controller.getScreenCoordinate();
            },
            child: const Text("getScreenCoordinate of center my map"),
          ),
          Obx(() {
            return Text(
              "getScreenCoordinate for latLng (above):-  ${controller.getScreenCoordinate.value}",
            );
          }),
        ],
      ),
    );
  }
}

class GMap extends StatelessWidget {
  const GMap({
    super.key,
    required this.controller,
  });

  final MapsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      height: 300,
      width: double.infinity,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: controller.kGooglePlex.value,
        onMapCreated: (GoogleMapController controllerCamera) {
          controller.gmc = controllerCamera;
        },
        markers: controller.markerList,
        onTap: (laglng) {
          controller.markerList.removeWhere(
              (element) => element.markerId == const MarkerId("0"));
          controller.markerList
              .add(Marker(markerId: const MarkerId("0"), position: laglng));
        },
        onLongPress: (laglng) {
          controller.markerList.add(Marker(
              markerId: MarkerId("${controller.markerList.length}"),
              position: laglng));
        },
      ),
    );
  }
}
