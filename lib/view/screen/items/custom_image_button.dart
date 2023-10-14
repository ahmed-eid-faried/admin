import 'dart:io';

import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.icon,
    required this.image,
  });
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  final File? image;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              image == null ? null : AppColor.thirdColor)),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
