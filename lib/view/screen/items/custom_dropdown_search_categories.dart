
import 'package:adminapp/controller/items/items_edit_controller.dart';
import 'package:adminapp/core/constant/fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownSearchCategories extends StatelessWidget {
  const CustomDropdownSearchCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsEditController());

    return GetBuilder<ItemsEditController>(builder: (controller) {
      return DropdownSearch<String>(
        items: [
          ...List.generate(controller.categories.length,
              (index) => controller.categories[index].categoriesName!)
        ],
        popupProps: PopupPropsMultiSelection.menu(
          searchFieldProps: const TextFieldProps(
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "Search",
                  contentPadding: EdgeInsets.all(2)),
              padding: EdgeInsets.all(2)),
          showSearchBox: true,
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
        selectedItem: controller.selectedItem,
      );
    });
  }
}
