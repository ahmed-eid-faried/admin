// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class SettingController extends GetxController {
  notification(bool value);
  address();
  aboutus();
  contactus();
  logout();
  intialData();
  orders();
  archive();
}

class SettingControllerImp extends SettingController {
  bool? notificationState = true;
  MyService myServices = Get.find();
  @override
  aboutus() {}

  @override
  address() {
    Get.toNamed(AppRoute.addressview);
  }

  @override
  @override
  logout() {
    String userid = myServices.pref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic(userid);
    myServices.pref.clear();
    Get.toNamed(AppRoute.login);
  }

  @override
  notification(value) {
    String? id = myServices.pref.getString("id");
    notificationState = value;
    myServices.pref.setBool("notificationState", value);
    if (notificationState == true) {
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users$id");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$id");
    }
    update();
  }

  @override
  intialData() {
    bool? state = myServices.pref.getBool("notificationState");
    if (state != null) {
      notificationState = state;
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  orders() {
    Get.toNamed(AppRoute.ordersView);
  }

  @override
  archive() {
    Get.toNamed(AppRoute.orderarchive);
  }

  @override
  contactus() {
    Get.toNamed(AppRoute.contactus);
  }
}
