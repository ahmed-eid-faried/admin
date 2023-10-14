import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/data/model/home_pages_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adminapp/controller/home_controller.dart';

class CustomButtonAppBar extends GetView<OrdersControllerImp> {
  final HomePagesModel homePage;
  final int index;
  const CustomButtonAppBar({
    super.key,
    required this.index,
    required this.homePage,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.changePage(index);
      },
      child: GetBuilder<OrdersControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(
              homePage.icon,
              color: controller.currentpage == index
                  ? AppColor.primaryColor
                  : AppColor.grey2,
              size: 30,
            ),
            // Text(
            //   homePage.title,
            //   style: TextStyle(
            //     color: controller.currentpage == index
            //         ? AppColor.primaryColor
            //         : AppColor.grey2,
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}
