import 'package:adminapp/controller/items/items_view_controller.dart';
import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/view/widget/items/custom_card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return GetBuilder<ItemsViewController>(
      builder: (controller) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.add();
              },
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              title: const Text(
                "Products",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              centerTitle: true,
              backgroundColor: AppColor.primaryColor,
            ),
            body: HandlingDataView(
              statusRequest: controller.statusRequest,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      return CustomCardItemsView(
                          itemsModel: controller.dataList[index]);
                    }),
              ),
            ));
      },
    );
  }
}
