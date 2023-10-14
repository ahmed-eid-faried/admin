import 'package:adminapp/controller/items/items_view_controller.dart';
import 'package:adminapp/core/constant/applink.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:adminapp/data/model/items_model.dart';
import 'package:get/get.dart';

class CustomCardItemsView extends StatelessWidget {
  const CustomCardItemsView({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    ItemsViewController controller = Get.put(ItemsViewController());
    return InkWell(
      onTap: () {
        controller.edit(itemsModel);
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
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageitems}/${itemsModel.itemsImage}",
                    placeholder: (context, url) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: AppColor.secondColor,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListTile(
                  title: Text(itemsModel.itemsName ?? ''),
                  subtitle: Text(itemsModel.itemsNameAr ?? ''),
                  trailing: IconButton(
                      onPressed: () {
                        controller.delete(itemsModel.itemsId);
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
