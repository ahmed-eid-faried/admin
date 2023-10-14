import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/items.dart';
import 'package:adminapp/data/model/items_model.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController {
  List dataList = [];
  ItemsData itemsData = ItemsData(Get.find());
  late StatusRequest statusRequest;
  MyService myServices = Get.find();
  List<ItemsModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.viewItems();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        dataList = responseData.map((e) => ItemsModel.fromJson(e)).toList();
      } else {
        Get.defaultDialog(middleText: "Please Try Add items");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(itemsid) async {
    Get.defaultDialog(
      middleText: "Are You Delete This  Category?",
      onCancel: () {
        Get.back();
      },
      onConfirm: () async {
        Map map = {"itemsid": itemsid};
        await itemsData.deleteItems(map);
        dataList.removeWhere((element) => element.itemsId == itemsid);
        Get.back();
        update();
      },
    );
  }

  add() {
    Get.toNamed(AppRoute.itemsadd);
  }

  edit(itemsModel) {
    Get.toNamed(AppRoute.itemsedit, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
