import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future<void> enterTheOtherLocation(
    BuildContext context, double inlatitude, double inlongitude) async {
  final AwesomeDialog dialog = AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: 'Distance Between Two',
    desc: 'Please enter the other location to calculate',
    body: KColumn(
      inlatitude: inlatitude.obs,
      inlongitude: inlongitude.obs,
    ),
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  );
  dialog.show();
}

class KColumn extends StatelessWidget {
  KColumn({
    Key? key,
    required this.inlatitude,
    required this.inlongitude,
  }) : super(key: key);

  final RxDouble inlatitude;
  final RxDouble inlongitude;
  final RxDouble kdistanceBetween = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (x) {
            inlatitude.value = double.tryParse(x) ?? 0.0;
          },
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Latitude'),
        ),
        TextField(
          onChanged: (x) {
            inlongitude.value = double.tryParse(x) ?? 0.0;
          },
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Longitude'),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(() {
            final distance = Geolocator.distanceBetween(
                inlatitude.value, inlongitude.value, inlatitude.value, inlongitude.value);
            kdistanceBetween.value = distance / 1000;
            return Text(
              'Measure of distance between your location and point (${inlatitude.value}, ${inlongitude.value}) in kilometers is ${kdistanceBetween.value.toStringAsFixed(2)}',
            );
          }),
        ),
      ],
    );
  }
}
