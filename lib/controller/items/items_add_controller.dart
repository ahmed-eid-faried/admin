import 'dart:io';

import 'package:adminapp/controller/items/items_view_controller.dart';
import 'package:adminapp/core/class/camera.dart';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/Items.dart';
import 'package:adminapp/data/datasource/remote/categories.dart';
import 'package:adminapp/data/model/categories_model.dart';
import 'package:adminapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
  TextEditingController? name;
  TextEditingController? namear;
  TextEditingController? des;
  TextEditingController? desar;
  TextEditingController? count;
  TextEditingController? price;
  TextEditingController? discount;
  bool active = true;
  String? get isActive => active ? "1" : "0";

  String? categoriesid;
  GlobalKey<FormState>? formstate;
  File? image;
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();
  List<ItemsModel> data = [];
  List categoriesList = [];
  List<CategoriesModel> categories = [];
  CategoriesData categoriesData = CategoriesData(Get.find());
  addData() async {
    if (formstate!.currentState!.validate()) {
      if (categoriesid == null) {
        Get.defaultDialog(middleText: "Please, try again");
      } else if (image == null) {
        Get.defaultDialog(middleText: "Please, Enter Image");
      } else {
        statusRequest = StatusRequest.loading;
        update();
        Map map = {
          "name": name!.text,
          "namear": namear!.text,
          "des": des!.text,
          "desar": desar!.text,
          "count": double.parse(count!.text).round().toString(),
          "active": isActive,
          "price": price!.text,
          "discount": discount!.text,
          "categoriesid": categoriesid!,
        };

        var response = await itemsData.addItems(map, image!);
        statusRequest = handlingData(response);
        print(statusRequest);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            print(response);
            ItemsViewController con = Get.find();
            Get.back();
            con.getData();
          } else {
            Get.defaultDialog(middleText: "Please Try Add Items");
            statusRequest = StatusRequest.failure;
            print(response);
          }
        }
        update();
      }
    }
  }

  gallery() async {
    Camera camera = Camera();
    image = await camera.uploadImageGallery();
    update();
  }

  camera() async {
    Camera camera = Camera();
    image = await camera.uploadImageCamera();
    update();
  }

  intialData() {
    name = TextEditingController();
    namear = TextEditingController();
    des = TextEditingController();
    desar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    // categoriesid = TextEditingController();
    formstate = GlobalKey<FormState>();
  }

  @override
  void onInit() {
    intialData();
    getData();
    super.onInit();
  }

  onChangedDropDown(value) {
    for (int i = 0; i < categories.length; i++) {
      categories[i].categoriesName == value
          ? categoriesid = categories[i].categoriesId
          : null;
    }
    print("$categoriesid $value");
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.viewCategories();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        categories =
            responseData.map((e) => CategoriesModel.fromJson(e)).toList();
      } else {
        Get.defaultDialog(middleText: "Please Try Add Categories");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
