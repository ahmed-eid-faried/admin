import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/order/prepare.dart';
import 'package:adminapp/data/model/orders.dart';
import 'package:get/get.dart';

class PrepareOrdersViewController extends GetxController {
  PrepareOrdersData prepareOrdersData = PrepareOrdersData(Get.find());

  late StatusRequest statusRequest;
  // String? userid;
  MyService myServices = Get.find();
  List<OrdersModel> data = [];
  String? deliveryid;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await prepareOrdersData.viewOrders();
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(statusRequest);
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

  prepared(String? userid, String? ordersid, String? ordertype) async {
    statusRequest = StatusRequest.loading;
    update();
    deliveryid = myServices.pref.getString("id");
    var response = await prepareOrdersData.prepareOrders(
      ordersid!,
      userid!,
      ordertype!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
      } else {
        Get.defaultDialog(middleText: "No Orders");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
