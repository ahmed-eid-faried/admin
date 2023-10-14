
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showDialog(context, position) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: ' your Current Position',
    desc: position,
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  ).show();
}
