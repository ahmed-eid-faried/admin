import 'package:adminapp/controller/items/items_add_controller.dart';
import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/fonts.dart';
import 'package:adminapp/core/function/validinput.dart';
import 'package:adminapp/view/screen/items/custom_image_button.dart';
import 'package:adminapp/view/widget/auth/custom_button_auth.dart';
import 'package:adminapp/view/widget/auth/custom_text_field_auth.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddController());
    return GetBuilder<ItemsAddController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Add Product",
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
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        CustomTextFieldGlobal(
                            validator: (val) => validator(val, "text"),
                            controller: controller.name,
                            label: "name",
                            hintText: "name",
                            icon: Icons.ac_unit_rounded),
                        CustomTextFieldGlobal(
                            validator: (val) => validator(val, "text"),
                            controller: controller.namear,
                            label: "name arabic",
                            hintText: "name arabic",
                            icon: Icons.ac_unit_rounded),
                        CustomTextFieldGlobal(
                            validator: (val) => validator(val, "text"),
                            controller: controller.des,
                            label: "des",
                            hintText: "des",
                            icon: Icons.ac_unit_rounded),
                        CustomTextFieldGlobal(
                            validator: (val) => validator(val, "text"),
                            controller: controller.desar,
                            label: "des arabic",
                            hintText: "des arabic",
                            icon: Icons.ac_unit_rounded),
                        CustomTextFieldGlobal(
                            validator: (val) => validator(val, "num"),
                            controller: controller.count,
                            keyboardType: TextInputType.number,
                            label: "count",
                            hintText: "count",
                            icon: Icons.ac_unit_rounded),
                        CustomTextFieldGlobal(
                            validator: (val) => validator(val, "num"),
                            controller: controller.price,
                            keyboardType: TextInputType.number,
                            label: "price",
                            hintText: "price",
                            icon: Icons.ac_unit_rounded),
                        CustomTextFieldGlobal(
                            validator: (val) => validator(val, "num"),
                            controller: controller.discount,
                            keyboardType: TextInputType.number,
                            label: "discount",
                            hintText: "discount",
                            icon: Icons.ac_unit_rounded),
                        ListTile(
                          title: const Text(
                            "Active",
                            style: AppFonts.textStyle9,
                          ),
                          trailing: Switch(
                            value: controller.active,
                            onChanged: (value) => {
                              controller.active = value,
                              controller.update(),
                              print(controller.active)
                            },
                          ),
                        ),
                        DropdownSearch<String>(
                          items: [
                            ...List.generate(
                                controller.categories.length,
                                (index) => controller
                                    .categories[index].categoriesName!)
                          ],
                          popupProps: PopupPropsMultiSelection.menu(
                            showSelectedItems: true,
                            title: const Center(
                                child: Text(
                              "Categories",
                              style: AppFonts.textStyle9,
                            )),
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          onChanged: (value) {
                            controller.onChangedDropDown(value);
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomImageButton(
                                title: 'Camera',
                                icon: Icons.camera,
                                image: controller.image,
                                onPressed: () => controller.camera()),
                            const Text("OR"),
                            CustomImageButton(
                                title: 'Gallery',
                                icon: Icons.image_sharp,
                                image: controller.image,
                                onPressed: () => controller.gallery()),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomButtonGlobal(
                            text: "Add Catogries",
                            onPressed: () {
                              controller.addData();
                            }),
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
