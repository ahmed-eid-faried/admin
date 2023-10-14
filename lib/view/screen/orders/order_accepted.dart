import 'package:adminapp/controller/orders/accepted_orders_controller.dart';
import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/fonts.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/data/model/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        title: const Text("Accepted Orders"),
        leading: IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.home);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<AcceptedOrdersViewController>(
        builder: (controller) {
          return HandlingDataView(              view: true,

              statusRequest: controller.statusRequest,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrdersModel ordersModel = controller.data[index];

                    return Card(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                    "Number Of Order:  ${ordersModel.ordersId!}",
                                    style: AppFonts.textStyle7),
                                trailing: Text(
                                  Jiffy.parse(ordersModel.ordersDatetime!,
                                          pattern: "yyyy-MM-dd")
                                      .fromNow()
                                      .toString(),
                                  style: AppFonts.textStyle6,
                                ),
                              ),
                              Text(
                                  "Recive Type:  ${controller.getValOfReciveType(ordersModel.ordersRecivetype!)}",
                                  style: AppFonts.textStyle4),
                              Text(
                                  "Orders Price:  ${ordersModel.ordersPrice!} \$",
                                  style: AppFonts.textStyle4),
                              ordersModel.ordersPricedelivery != "0"
                                  ? Text(
                                      "delivery Price:  ${ordersModel.ordersPricedelivery!} \$",
                                      style: AppFonts.textStyle4)
                                  : const Text("delivery Price:  Free",
                                      style: AppFonts.textStyle4),
                              Text(
                                  "Payment Method:  ${controller.getValOfPaymentMethod(ordersModel.ordersPaymentmethod!)}",
                                  style: AppFonts.textStyle4),
                              const Divider(color: AppColor.primaryColor),
                              Text(
                                  "Order Status:  ${controller.getValOfOrderStatus(ordersModel.ordersStatus!)}",
                                  style: AppFonts.textStyle4),
                              const Divider(color: AppColor.primaryColor),
                              Row(
                                children: [
                                  Text(
                                      "Total Price:  ${ordersModel.ordersTotalprice!} \$",
                                      textAlign: TextAlign.start,
                                      style: AppFonts.textStyle),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoute.orderdetails,
                                            arguments: {
                                              "ordersModel": ordersModel
                                            });
                                      },
                                      child: const Text("Details")),
                                ],
                              ),
                            ]),
                      ),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
