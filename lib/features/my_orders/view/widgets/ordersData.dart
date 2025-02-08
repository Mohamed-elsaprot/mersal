import 'package:mersal/features/my_orders/model/Links.dart';
import 'package:mersal/features/my_orders/model/MyOrder.dart';

class OrdersData{
  OrdersData({
    this.links,
    this.ordersList,
});
  Links? links;
  List<MyOrder>? ordersList;

  OrdersData.fromJson(dynamic json) {
    links = Links.fromJson(json['links']);
    if (json['data'] != null) {
      ordersList = [];
      json['data'].forEach((v) {
        ordersList?.add(MyOrder.fromJson(v));
      });
    }
  }

}