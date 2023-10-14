import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/function/handling_data.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/datasource/remote/notifications_data.dart';
import 'package:adminapp/data/model/notifications_data_model.dart';
import 'package:flutter/material.dart';
import 'package:adminapp/core/class/handling_data_view.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          title: const Text("Notifications"),
          leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.home);
              },
              icon: const Icon(Icons.arrow_back))),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    NotificationsDataModel notificationsDataModel =
                        controller.data[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          // controller.edit(NotificationsDataModel);
                        },
                        title: Text(notificationsDataModel.notificationsTitle!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 1),
                        leading:
                            const Icon(Icons.notifications_active, size: 30),
                        subtitle: Text(
                            notificationsDataModel.notificationsBody!,
                            textAlign: TextAlign.start,
                            maxLines: 3),
                        trailing: Text(
                          Jiffy.parse(
                                  notificationsDataModel.notificationsDatetime!,
                                  pattern: "yyyy-MM-dd")
                              .fromNow()
                              .toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
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

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<NotificationsDataModel> data = [];

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData.getData(userid!);
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(statusRequest);
      if (response['status'] == "success") {
        List responseData = response['data'];
        data = responseData
            .map((e) => NotificationsDataModel.fromJson(e))
            .toList();
        print(data);
      } else {
        Get.defaultDialog(middleText: "Please try again");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
