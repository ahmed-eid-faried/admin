import 'dart:io';

import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/applink.dart';

class ItemsData {
  Curd curd;
  ItemsData(
    this.curd,
  );
  addItems(Map map, File? file) async {
    var response = await curd.postRequestWithFile(AppLink.itemsadd, map, file!);
    return response.fold((l) => l, (r) => r);
  }

  deleteItems(Map map) async {
    var response = await curd.postData(AppLink.itemsdelete, map);
    return response.fold((l) => l, (r) => r);
  }

  viewItems() async {
    var response = await curd.postData(AppLink.itemsview, {});
    return response.fold((l) => l, (r) => r);
  }

  editItems(Map map, File? file) async {
    if (file == null) {
      var response = await curd.postData(AppLink.itemsedit, map);
      return response.fold((l) => l, (r) => r);
    } else {
      var response =
          await curd.postRequestWithFile(AppLink.itemsedit, map, file);
      return response.fold((l) => l, (r) => r);
    }
  }
}
