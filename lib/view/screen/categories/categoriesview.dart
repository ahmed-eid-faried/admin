import 'package:adminapp/controller/categories/categories_view_controller.dart';
import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/constant/color.dart';
  import 'package:adminapp/view/widget/categories/custom_card_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());
    return GetBuilder<CategoriesViewController>(
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
                "Catogries",
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
                      return CustomCardCategoriesView(
                          categoriesModel: controller.dataList[index]);
                    }),
              ),
            ));
      },
    );
  }
}
