import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/categories.dart';
import 'package:adminapp/data/model/categories_model.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  List dataList = [];

  CategoriesData categoriesData = CategoriesData(Get.find());
  late StatusRequest statusRequest;
  // String? userid;
  MyService myServices = Get.find();
  List<CategoriesModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.viewCategories();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        dataList =
            responseData.map((e) => CategoriesModel.fromJson(e)).toList();
      } else {
        Get.defaultDialog(middleText: "Please Try Add Categories");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(categoriesid) async {
    Get.defaultDialog(
      middleText: "Are You Delete This  Category?",
      onCancel: () {
        Get.back();
      },
      onConfirm: () async {
        Map map = {"categoriesid": categoriesid};
        await categoriesData.deleteCategories(map);
        dataList.removeWhere((element) => element.categoriesId == categoriesid);
        Get.back();
        update();
      },
    );
  }

  add() {
    Get.toNamed(AppRoute.categoriesadd);
  }

  edit(categoriesModel) {
    Get.toNamed(AppRoute.categoriesedit,
        arguments: {"categoriesModel": categoriesModel});
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
