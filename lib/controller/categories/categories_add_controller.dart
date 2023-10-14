import 'dart:io';

import 'package:adminapp/controller/categories/categories_view_controller.dart';
import 'package:adminapp/core/class/camera.dart';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/categories.dart';
import 'package:adminapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  TextEditingController? name;
  TextEditingController? namear;
  GlobalKey<FormState>? formstate;
  File? image;
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();
  List<CategoriesModel> data = [];

  addData() async {
    if (name!.text == null) {
      Get.defaultDialog(middleText: "Please, Enter Name");
    } else if (namear!.text == null) {
      Get.defaultDialog(middleText: "Please, Enter Arabic Name ");
    } else if (image == null) {
      Get.defaultDialog(middleText: "Please, Enter Image");
    } else {
      statusRequest = StatusRequest.loading;
      update();
      Map map = {
        "name": name!.text,
        "namear": namear!.text,
      };
      var response = await categoriesData.addCategories(map, image!);
      statusRequest = handlingData(response);
      print(statusRequest);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          print(response);
          CategoriesViewController con = Get.find();
          Get.back();
          con.getData();
        } else {
          Get.defaultDialog(middleText: "Please Try Add Categories");
          statusRequest = StatusRequest.failure;
          print(response);
        }
      }
      update();
    }
  }

  addImage() async {
    Camera camera = Camera();
    image = await camera.uploadImageGallerySvg(true);
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }
}
