import 'package:adminapp/controller/categories/categories_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/function/validinput.dart';
import 'package:adminapp/view/widget/auth/custom_button_auth.dart';
import 'package:adminapp/view/widget/auth/custom_text_field_auth.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesEditController());
    return GetBuilder<CategoriesEditController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Add Catogries",
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
                  child: ListView(
                    children: [
                      CustomTextFieldGlobal(
                          validator: (val) => validator(val, "email"),
                          controller: controller.name,
                          label: "name",
                          hintText: "name",
                          icon: Icons.email_outlined),
                      CustomTextFieldGlobal(
                          validator: (val) => validator(val, "email"),
                          controller: controller.namear,
                          label: "name arabic",
                          hintText: "name arabic",
                          icon: Icons.email_outlined),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () => controller.editImage,
                          child: Text("Edit Image",
                              style: TextStyle(
                                  color: controller.image == null
                                      ? null
                                      : AppColor.green))),
                      const SizedBox(height: 20),
                      CustomButtonGlobal(
                          text: "Save",
                          onPressed: () {
                            controller.editData();
                          }),
                    ],
                  )),
            ));
      },
    );
  }
}
