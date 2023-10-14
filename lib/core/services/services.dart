import 'package:adminapp/core/maps/geolactor/get_des_of_position.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:adminapp/firebase_options.dart';

class MyService extends GetxService {
  late SharedPreferences pref;
  LocationMap locationMap = LocationMap();

  Future<MyService> init() async {
    pref = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // await locationMap.check(null);

    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);
    // await requestPermissionsMessage();
    // await gettokens();
    // await intialmassage();
    // onMessageOpenedApp();
    // onBackgroundMessage();
    return this;
  }
}

initService() async {
  await Get.putAsync(() => MyService().init());
}
