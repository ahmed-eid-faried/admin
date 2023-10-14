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

class ItemsEditController extends GetxController {
  TextEditingController? name;
  TextEditingController? namear;
  TextEditingController? des;
  TextEditingController? desar;
  TextEditingController? count;
  TextEditingController? price;
  TextEditingController? discount;
  bool active = true;
  String? get isActive => active ? "1" : "0";
  String? categoriesid = "";
  String? selectedItem = "";
  GlobalKey<FormState>? formstate;
  File? image;
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();
  List<ItemsModel> data = [];
  String? imageold = "";
  String? itemsid = "";
  late ItemsModel itemsModel;
  List categoriesList = [];
  List<CategoriesModel> categories = [];
  CategoriesData categoriesData = CategoriesData(Get.find());
  editData() async {
    if (formstate!.currentState!.validate()) {
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
        "itemsid": itemsid,
      };
      print(map);
      var response = await itemsData.editItems(map, image!);
      statusRequest = handlingData(response);
      print(statusRequest);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
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

  gallery() async {
    Camera camera = Camera();
    image = await camera.uploadImageGallery();
    update();
  }

  camera() async {
    Camera camera = Camera();
   await camera.addImageApp(image);
    update();
  }

  intialData() async {
    name = TextEditingController();
    namear = TextEditingController();
    des = TextEditingController();
    desar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    formstate = GlobalKey<FormState>();
    itemsModel = Get.arguments['itemsModel'];
    name!.text = itemsModel.itemsName!;
    namear!.text = itemsModel.itemsNameAr!;
    imageold = itemsModel.itemsImage!;
    itemsid = itemsModel.itemsId!;
    des!.text = itemsModel.itemsDes!;
    desar!.text = itemsModel.itemsDesAr!;
    count!.text = itemsModel.itemsCount!;
    price!.text = itemsModel.itemsPrice!;
    discount!.text = itemsModel.itemsDiscount!;
    active = itemsModel.itemsActive == "1" ? true : false;
    categoriesid = itemsModel.itemsCategories;
    await getData();
    // selectedItem = categories[int.parse(categoriesid!)].categoriesName;
    // xxx();
    // selectedItem =
    selectedItemDropDown(categoriesid);

    update();
  }

  selectedItemDropDown(value) async {
    for (int i = 0; i < categories.length; i++) {
      categories[i].categoriesId == value
          ? selectedItem = categories[i].categoriesName
          : null;
    }
    print("$categoriesid $value");
  }

  onChangedDropDown(value) async {
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

  @override
  void onInit() async {
    await intialData();
    print("categoriesId:- $categoriesid");

    print("selectedItem:- $selectedItem");
    super.onInit();
  }
}
