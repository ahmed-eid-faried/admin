import 'dart:io';

import 'package:adminapp/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Camera {
  final ImagePicker picker = ImagePicker();
  File? image;
  Future<File?> uploadImageCamera() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      // update();
      return image;
    }
    return null;
  }

  Future<File?> uploadImageGallery() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      // update();
      return image;
    }
    return null;
  }

  Future<File?> uploadImageGallerySvg([isSvg = false]) async {
    FilePickerResult? pickedImage = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ['svg', 'SVG'] : ['jpg', 'png', 'PNG', 'jpeg', 'gif'],
    );
    if (pickedImage != null) {
      image = File(pickedImage.files.single.path!);
      // update();
      return image;
    } else {
      return null;
    }
  }

  addImageApp(imagel) async {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.backgroundcolor,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                child: Text(
                  'Choose your image',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  imagel = await uploadImageCamera();
                  Get.back();
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera),
                    SizedBox(width: 10),
                    Text('Camera'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  imagel = await uploadImageGallery();
                  Get.back();
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.image_sharp),
                    SizedBox(width: 10),
                    Text('Gallery'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.1),
    );
    // print(image!.path);
    // return image;
    // if (image != null) {
    //   print(image!.path);
    //   return image;
    // } else {
    //   print("No image selected.");
    //   return null;
    // }
  }
}
