import 'package:adminapp/controller/categories/categories_view_controller.dart';
import 'package:adminapp/core/constant/applink.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adminapp/data/model/categories_model.dart';
import 'package:get/get.dart';

class CustomCardCategoriesView extends StatelessWidget {
  const CustomCardCategoriesView({
    Key? key,
    required this.categoriesModel,
  }) : super(key: key);

  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    CategoriesViewController controller = Get.put(CategoriesViewController());
    return InkWell(
      onTap: () {
        controller.edit(categoriesModel);
      },
      child: SizedBox(
        height: 130,
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.network(
                    "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
                    color: AppColor.secondColor,
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListTile(
                  title: Text(categoriesModel.categoriesName ?? ''),
                  subtitle: Text(categoriesModel.categoriesNameAr ?? ''),
                  trailing: IconButton(
                      onPressed: () {
                        controller.delete(categoriesModel.categoriesId);
                      },
                      icon: const Icon(Icons.delete)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
