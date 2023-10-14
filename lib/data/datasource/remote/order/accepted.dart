// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/core/constant/applink.dart';

class AcceptedOrdersData {
  Curd curd;
  AcceptedOrdersData(this.curd);

  viewOrders() async {
    var response =
        await curd.postData(AppLink.acceptedorders, {});
    return response.fold((l) => l, (r) => r);
  }


}
