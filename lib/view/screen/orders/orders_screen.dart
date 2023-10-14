import 'package:adminapp/controller/home_controller.dart';
import 'package:adminapp/view/widget/bottomNavigationBar/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImp());
    return GetBuilder<OrdersControllerImp>(
      builder: (controller) => Scaffold(
          bottomNavigationBar: const CustomBottomAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: controller.ordersPages[controller.currentpage].page),
          )),
    );
  }
}
// WillPopScope(
//               onWillPop: () {
//                 Get.defaultDialog(
//                   title: "Warning",
//                   middleText: "Do You Want To Exit The App",
//                   onConfirm: () => exit(0),
//                   onCancel: () => Get.back(),
//                 );
//                 return Future.value(false);
//               },
//               child: 