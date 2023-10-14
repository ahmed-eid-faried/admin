import 'package:adminapp/view/widget/bottomNavigationBar/custom_button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adminapp/controller/home_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImp());

    return GetBuilder<OrdersControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(controller.ordersPages.length, (index) {
              return CustomButtonAppBar(
                homePage: controller.ordersPages[index],
                index: index,
              );
            }),
          ],
        ),
      ),
    );
  }
}
