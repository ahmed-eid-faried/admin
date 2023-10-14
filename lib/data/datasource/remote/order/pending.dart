// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/applink.dart';

class OrdersData {
  Curd curd;
  OrdersData(this.curd);

  viewOrders() async {
    var response = await curd.postData(AppLink.pendingorders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String ordersid, String userid) async {
    var response = await curd.postData(AppLink.approveorders, {
      "ordersid": ordersid,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
