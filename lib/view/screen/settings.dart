import 'package:adminapp/controller/settings.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Appsize size = Appsize();
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: AppColor.primaryColor,
              height: size.w33,
              width: size.width,
            ),
            Positioned(
              top: size.w23,
              right: size.width / 2.8,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(150)),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                    radius: 38,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: size.h10),
        Card(
          child: Column(
            children: [
              SizedBox(height: size.h02),
              GetBuilder<SettingControllerImp>(
                builder: (controller) => ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.notifications);
                  },
                  trailing: Switch(
                      value: controller.notificationState!,
                      onChanged: (value) {
                        controller.notification(value);
                      }),
                  title: const Text("Notifiactions"),
                ),
              ),
              SizedBox(height: size.h02),
              ListTile(
                trailing: const Icon(Icons.shopify_sharp),
                title: const Text("Orders"),
                onTap: () {
                  controller.orders();
                },
              ),
              SizedBox(height: size.h02),
              ListTile(
                trailing: const Icon(Icons.shopping_basket),
                title: const Text("Archive"),
                onTap: () {
                  controller.archive();
                },
              ),
              SizedBox(height: size.h02),
              ListTile(
                trailing: const Icon(Icons.location_searching_outlined),
                title: const Text("Address"),
                onTap: () {
                  controller.address();
                },
              ),
              SizedBox(height: size.h02),
              ListTile(
                trailing: const Icon(Icons.help_outline_rounded),
                title: const Text("About us"),
                onTap: () {
                  controller.aboutus();
                },
              ),
              SizedBox(height: size.h02),
              ListTile(
                trailing: const Icon(Icons.phone_android_outlined),
                title: const Text("Contact us"),
                onTap: () {
                  controller.contactus();
                },
              ),
              SizedBox(height: size.h02),
              ListTile(
                trailing: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () {
                  controller.logout();
                },
              ),
              SizedBox(height: size.h02),
            ],
          ),
        ),
      ],
    );
  }
}
