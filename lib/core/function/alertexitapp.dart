import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "تنبيه", content: const Text("data"), actions: [
    TextButton(
        onPressed: () {
          exit(0);
        },
        child: const Text("confirm")),
    TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("cancel"))
  ]);
  return Future.value(true);
}
