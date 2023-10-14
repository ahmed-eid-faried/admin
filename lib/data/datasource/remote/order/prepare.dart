import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/applink.dart';

class PrepareOrdersData {
  Curd curd;
  PrepareOrdersData(this.curd);

  viewOrders() async {
    var response = await curd.postData(AppLink.preparevieworders, {});
    return response.fold((l) => l, (r) => r);
  }

  prepareOrders(String ordersid, String userid, String ordertype) async {
    var response = await curd.postData(AppLink.prepareorders, {
      "ordersid": ordersid,
      "userid": userid,
      "ordersrecivetype": ordertype,
    });
    return response.fold((l) => l, (r) => r);
  }
}
