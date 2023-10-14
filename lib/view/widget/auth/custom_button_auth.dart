import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonGlobal extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButtonGlobal(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: AppColor.primaryColor,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(text),
    );
  }
}
