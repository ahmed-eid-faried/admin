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

class CategoriesEditController extends GetxController {
  TextEditingController? name;
  TextEditingController? namear;
  String? imageold = "";
  String? categoriesid = "";
  File? image;
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();
  List<CategoriesModel> data = [];
  late CategoriesModel categoriesModel;
  editData() async {
    if (name!.text == null) {
      Get.defaultDialog(middleText: "Please, Enter Name");
    } else if (namear!.text == null) {
      Get.defaultDialog(middleText: "Please, Enter Arabic Name ");
    } else {
      statusRequest = StatusRequest.loading;
      update();
      Map map = {
        "name": name!.text,
        "namear": namear!.text,
        "imageold": imageold!,
        "categoriesid": categoriesid!
      };
      var response = await categoriesData.editCategories(map, image);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          CategoriesViewController con = Get.find();
          Get.back();
          con.getData();
        } else {
          Get.defaultDialog(middleText: "Please Try Add Categories");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  editImage() async {
    Camera camera = Camera();
    image = await camera.uploadImageGallerySvg(true);
    update();
  }

  intialData() {
    name = TextEditingController();
    namear = TextEditingController();
    categoriesModel = Get.arguments['categoriesModel'];
    name!.text = categoriesModel.categoriesName!;
    namear!.text = categoriesModel.categoriesNameAr!;
    imageold = categoriesModel.categoriesImage!;
    categoriesid = categoriesModel.categoriesId!;
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
