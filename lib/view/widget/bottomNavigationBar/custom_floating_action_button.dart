import 'package:adminapp/controller/home_controller.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImp());

    return GetBuilder<OrdersControllerImp>(
      builder: (controller) => FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(AppRoute.cart);
        },
        child: const Icon(Icons.shopping_basket_outlined),
      ),
    );
  }
}
