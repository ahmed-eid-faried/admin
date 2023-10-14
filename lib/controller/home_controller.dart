// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/data/model/home_pages_model.dart';
import 'package:adminapp/view/screen/orders/order_accepted.dart';
import 'package:adminapp/view/screen/orders/order_archive.dart';
import 'package:adminapp/view/screen/orders/orders.dart';
import 'package:adminapp/view/screen/orders/prepareorders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersController extends GetxController {
  changePage(int index);
}

class OrdersControllerImp extends OrdersController {
  int currentpage = 0;
  List<HomePagesModel> ordersPages = [
    HomePagesModel(
        title: "Pending", icon: Icons.card_travel, page: const OrdersView()),
    HomePagesModel(
        title: "Prepare",
        icon: Icons.settings_suggest_outlined,
        page: const PrepareOrdersView()),
    HomePagesModel(
        title: "Accepted",
        icon: Icons.check_circle_outline,
        page: const OrderAccepted()),
    HomePagesModel(
        title: "Archive",
        icon: Icons.archive_outlined,
        page: const OrderArchive()),
    // HomePagesModel(
    //     title: "Settings", icon: Icons.settings, page: const Settings()),
  ];
  @override
  changePage(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
// Firebasema
    super.onInit();
  }
}
