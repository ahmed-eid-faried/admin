import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/fonts.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/controller/orders/order_details_controller.dart';
import 'package:adminapp/view/screen/orders/cutom_map_orders_detials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        title: const Text("Orders Details"),
        leading: IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.home);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    Card(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const SizedBox(height: 20),
                              Table(
                                children: [
                                  const TableRow(children: [
                                    Text("Item",
                                        textAlign: TextAlign.center,
                                        style: AppFonts.textStyle),
                                    Text("QTY",
                                        textAlign: TextAlign.center,
                                        style: AppFonts.textStyle),
                                    Text("Price",
                                        textAlign: TextAlign.center,
                                        style: AppFonts.textStyle),
                                  ]),
                                  ...List.generate(controller.itemsData.length,
                                      (index) {
                                    return TableRow(children: [
                                      Text(
                                        '${controller.itemsData[index].itemsName!} ',
                                        style: AppFonts.textStyle2,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '${controller.itemsData[index].countitems!} ',
                                        style: AppFonts.textStyle2,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '${controller.itemsData[index].itemsprice!} ',
                                        style: AppFonts.textStyle2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ]);
                                  })
                                ],
                              ),
                              const Divider(color: AppColor.primaryColor),
                              const SizedBox(height: 10),
                              Text("Price: ${controller.ordersPrice} \$",
                                  style: AppFonts.textStyle4),
                              const SizedBox(height: 10),
                              Text(
                                  "adminapp Price: ${controller.ordersPriceadminapp} \$",
                                  style: AppFonts.textStyle4),
                              const SizedBox(height: 10),
                              Text("Coupon: ${controller.coupon} \$",
                                  style: AppFonts.textStyle4),
                              const SizedBox(height: 10),
                              Center(
                                  child: Text(
                                      "Total Price: ${controller.ordersTotalprice} \$",
                                      style: AppFonts.textStyle)),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      child: ListTile(
                        title: Text(controller.ordersAddress,
                            textAlign: TextAlign.start,
                            style: AppFonts.textStyle3,
                            maxLines: 1),
                        leading: const Icon(Icons.location_on,
                            color: AppColor.primaryColor, size: 30),
                        subtitle: Text(
                            "${controller.addressCity} ${controller.addressStreet}",
                            textAlign: TextAlign.start,
                            maxLines: 3),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (controller.ordersRecivetype == "0")
                      const CutomMapOrdersDetials(),
                    const SizedBox(height: 20),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
