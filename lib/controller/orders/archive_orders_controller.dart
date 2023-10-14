import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/order/archive.dart';
import 'package:adminapp/data/model/orders.dart';
import 'package:get/get.dart';

class ArchiveOrdersViewController extends GetxController {
  ArchiveOrdersData archiveOrdersData = ArchiveOrdersData(Get.find());

  late StatusRequest statusRequest;
  String? adminappid;
  MyService myServices = Get.find();
  List<OrdersModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveOrdersData.viewOrders();
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(statusRequest);
      print(response['status']);
      print(adminappid);

      if (response['status'] == "success") {
        List responseData = response['data'];
        data = responseData.map((e) => OrdersModel.fromJson(e)).toList();
        print(data);
      } else {
        Get.defaultDialog(middleText: "Please try again");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getValOfReciveType(String val) {
    return val == "0" ? "delivery" : "Receipt From The Store";
  }

  getValOfPaymentMethod(String val) {
    return val == "0" ? "Cash" : "Payment Method";
  }

  getValOfOrderStatus(String val) {
    switch (val) {
      case "0":
        return "Pending Approval";
      case "1":
        return "The order is being prepared";
      case "2":
        return "Ready to picked up by delivery man";
      case "3":
        return "on the way";
      default:
        return "Archived";
    }
  }
  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
