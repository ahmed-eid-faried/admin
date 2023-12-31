import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/data/datasource/remote/auth/verfiy_code_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  verfiyCodeSignUp();
  goToSuccessSignUp(String verificationCode);
  resend();
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  late String email;

  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());
  // StatusRequest? statusRequest;
  StatusRequest statusRequest = StatusRequest.noAction;

  @override
  verfiyCodeSignUp() {}

  @override
  goToSuccessSignUp(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postData(email, verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning",
            backgroundColor: AppColor.primaryColor.withOpacity(0.6),
            middleTextStyle: const TextStyle(color: Colors.white),
            middleText: "Verifycode isn't correct.");
        // statusRequest = StatusRequest.noAction;
      }
    }
    update();
    // Get.offAllNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  resend() {
    verfiyCodeSignUpData.resend(email);
  }
}
