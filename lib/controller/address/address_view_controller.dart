import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/address.dart';
import 'package:adminapp/data/model/address_data_model.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<AddressDataModel> data = [];

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddress(userid!);
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(statusRequest);
      if (response['status'] == "success") {
        List responseData = response['data'];
        data = responseData.map((e) => AddressDataModel.fromJson(e)).toList();
        print(data);
      } else {
        Get.defaultDialog(middleText: "Please Try Add Address");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(addressId) async {
    await addressData.deleteAddress(addressId!);
    data.removeWhere((element) => element.addressId == addressId);
    update();
  }

  edit(addressDataModel) {
    Get.toNamed(AppRoute.addressedit,
        arguments: {"addressDataModel": addressDataModel});
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
