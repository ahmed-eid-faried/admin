import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/imgaeasset.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            children: [
              CustomCardHome(
                title: "Catogries",
                image: AppImageAsset.avatar,
                onTap: () {
                  Get.toNamed(AppRoute.categoriesview);
                },
              ),
              CustomCardHome(
                title: "Products",
                image: AppImageAsset.box,
                onTap: () {
                  Get.toNamed(AppRoute.itemsview);
                },
              ),
              CustomCardHome(
                title: "Orders",
                image: AppImageAsset.orders,
                onTap: () {                  Get.toNamed(AppRoute.orders);
},
              ),
              CustomCardHome(
                title: "Message",
                image: AppImageAsset.message,
                onTap: () {},
              ),
              CustomCardHome(
                title: "Notifications",
                image: AppImageAsset.bell,
                onTap: () {},
              ),
              CustomCardHome(
                title: "Reports",
                image: AppImageAsset.analysis,
                onTap: () {},
              ),
              CustomCardHome(
                title: "Users",
                image: AppImageAsset.avatar,
                onTap: () {},
              ),
              CustomCardHome(
                title: "Users",
                image: AppImageAsset.avatar,
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });
  final String image;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120,
        child: Card(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(
                      image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(title)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
