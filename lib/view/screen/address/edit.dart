import 'package:adminapp/controller/address/address_edit_controller.dart';
import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/function/validinput.dart';
import 'package:adminapp/view/widget/auth/custom_text_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressEdit extends StatelessWidget {
  const AddAddressEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(" ADDRESS"),
        centerTitle: true,
      ),
      body: GetBuilder<AddressEditController>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: HandlingDataView(
              statusRequest: controller.statusRequest,
              child: ListView(
                children: [
                  CustomTextFieldGlobal(
                      validator: (val) => validator(val, "text"),
                      controller: controller.city,
                      label: "City",
                      hintText: "City",
                      icon: Icons.location_city_outlined),
                  CustomTextFieldGlobal(
                      validator: (val) => validator(val, "text"),
                      controller: controller.street,
                      label: "Street",
                      hintText: "Street",
                      icon: Icons.streetview_outlined),
                  CustomTextFieldGlobal(
                      validator: (val) => validator(val, "text"),
                      controller: controller.name,
                      label: "Address Name",
                      hintText: "Address Name",
                      icon: Icons.location_searching),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.clearData();
                        },
                        child: const Text("Clear Data")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.editAdress();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Edit Adress",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
