import 'dart:io';

import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/applink.dart';

class CategoriesData {
  Curd curd;
  CategoriesData(
    this.curd,
  );
  addCategories(Map map, File? file) async {
    var response =
        await curd.postRequestWithFile(AppLink.categoriesadd, map, file!);
    return response.fold((l) => l, (r) => r);
  }

  deleteCategories(Map map) async {
    var response = await curd.postData(AppLink.categoriesdelete, map);
    return response.fold((l) => l, (r) => r);
  }

  viewCategories() async {
    var response = await curd.postData(AppLink.categoriesview, {});
    return response.fold((l) => l, (r) => r);
  }

  editCategories(Map map, File? file) async {
    if (file == null) {
      var response = await curd.postData(AppLink.categoriesedit, map);
      return response.fold((l) => l, (r) => r);
    } else {
      var response =
          await curd.postRequestWithFile(AppLink.categoriesedit, map, file);
      return response.fold((l) => l, (r) => r);
    }
  }
}
