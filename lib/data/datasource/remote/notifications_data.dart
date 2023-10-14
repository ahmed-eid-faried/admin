// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/applink.dart';

class NotificationsData {
  Curd curd;
  NotificationsData(this.curd);
  getData(String userid) async {
    var response =
        await curd.postData(AppLink.notifications, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
