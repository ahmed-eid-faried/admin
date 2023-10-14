
import 'package:adminapp/controller/orders/order_details_controller.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class CutomMapOrdersDetials extends StatelessWidget {
  const CutomMapOrdersDetials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());

    return GetBuilder<OrderDetailsController>(builder: (controller) {
      return SizedBox(
        height: 250,
        width: 250,
        child: FlutterMap(
          mapController: controller.mapController,
          options: MapOptions(
              onTap: (tapPosition, point) {
                controller.getPositionOfOrder();
              },
              initialCenter: controller.latLng!,
              initialZoom: 14.5),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(markers: [
              Marker(
                  point: controller.latLng!,
                  width: 80,
                  height: 80,
                  builder: (context) => const Icon(
                        Icons.location_on,
                        size: 40,
                        color: AppColor.primaryColor,
                      ))
            ]),
          ],
        ),
      );
    });
  }
}
