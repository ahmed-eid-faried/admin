import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:adminapp/core/maps/geolactor/entertheotherlocation.dart';
import 'package:adminapp/core/maps/geolactor/get_des_of_position.dart';
import 'package:adminapp/core/maps/geolactor/show_dialog.dart' as showd;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(
//       home: Home(),
//     );
//   }
// }

class HomeController extends GetxController {
  var x1 = false.obs;
  var inlatitude = 0.0.obs;
  var inlongitude = 0.0.obs;
  var permission = LocationPermission.denied.obs;
  var position = "".obs;
  var distance = 0.0.obs;
  LocationMap locationMap = LocationMap();

  @override
  void onInit() {
    locationMap.check(null);
    super.onInit();
  }

  void checkLocationService() async {
    x1.value = await locationMap.check(null);
    locationMap.getDesOfCurrentPosition();
  }

  void checkPermission() async {
    permission.value = await locationMap.kcheckPermissionfun(null);
  }

  void getPositionForMobile() async {
    var position = await locationMap.getposition();
    showd.showDialog(Get.context!, "$position");
  }

  void getPositionUsingGeocoding() async {
    var position = await locationMap.getDesOfCurrentPosition();

    showd.showDialog(Get.context!, "$position");
  }

  void showDialogForDistance() {
    enterTheOtherLocation(Get.context!, inlatitude.value, inlongitude.value);
  }

  void calculateDistance() async {
    distance.value = await locationMap.measureofdistance(
      inlatitude.value,
      inlongitude.value,
    );
  }

  void showAwesomeDialog() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Check your Location services',
      desc: "Location services are disabled.",
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}

// class Home extends GetView<HomeController> {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("geolactor and geocoding"),
//       ),
//       body: Container(
//         width: double.infinity,
//         color: Colors.amber,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ElevatedButton(
//               onPressed: () => controller.checkLocationService(),
//               child: const Text("check"),
//             ),
//             Obx(() => Text(
//                 "check(isLocationServiceEnabled):- ${controller.x1.value}")),
//             ElevatedButton(
//               onPressed: () => controller.checkPermission(),
//               child: const Text("Permission"),
//             ),
//             Obx(() =>
//                 Text("check(Permission):- ${controller.permission.value}")),
//             ElevatedButton(
//               onPressed: () => controller.getPositionForMobile(),
//               child: const Text("getposition FOR Mobile"),
//             ),
//             Obx(() => Text("MyPosition:- ${controller.position.value}")),
//             ElevatedButton(
//               onPressed: () => controller.getPositionUsingGeocoding(),
//               child: const Text(
//                   "getDesOfPosition by geocoding FOR Android and IOS"),
//             ),
//             Obx(() => Text("MyPosition:- ${controller.position.value}")),
//             ElevatedButton(
//               onPressed: () => controller.showDialogForDistance(),
//               child: const Text("distance between two by dialog"),
//             ),
//             ElevatedButton(
//               onPressed: () => controller.calculateDistance(),
//               child: const Text("distance between two"),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SizedBox(
//                   width: 150,
//                   child: TextFormField(
//                     onChanged: (x) =>
//                         controller.inlatitude.value = double.tryParse(x) ?? 0.0,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(labelText: 'Latitude'),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 150,
//                   child: TextFormField(
//                     onChanged: (x) => controller.inlongitude.value =
//                         double.tryParse(x) ?? 0.0,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(labelText: 'Longitude'),
//                   ),
//                 ),
//               ],
//             ),
//             Obx(() => Text(
//                 "distance between YOUR LOCATION AND (${controller.inlongitude.value},${controller.inlongitude.value}):- ${controller.distance.value}")),
//             ElevatedButton(
//               onPressed: () => controller.showAwesomeDialog(),
//               child: const Text("AwesomeDialog"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
