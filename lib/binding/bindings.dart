import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/sizes.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
    Appsize size = Appsize();
    Get.put(size);

    // Get.lazyPut(() => HomeScreenControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
