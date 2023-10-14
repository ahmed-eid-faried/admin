import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/applink.dart';

class OrderDetailsData {
  Curd curd;
  OrderDetailsData(this.curd);

  getData(String orderid) async {
    var response =
        await curd.postData(AppLink.ordersdetails, {"orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
