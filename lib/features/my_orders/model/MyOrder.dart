import 'package:mersal/features/my_orders/model/Customer.dart';

import 'Address.dart';
import 'MyOrderProducts.dart';
import 'Timer.dart';

class MyOrder {
  MyOrder({
      this.dailyNumber, 
      this.orderNumber, 
      this.status, 
      this.totalProducts, 
      this.note, 
      this.restaurant, 
      this.address, 
      this.deliveryMethod, 
      this.paymentMethod, 
      this.deliveryCost, 
      this.createdAt, 
      this.newTime, 
      this.preprationTime, 
      this.readyTime, 
      this.inProgressDeliveryTime, 
      this.deliveryArrivalTime, 
      this.doneTime, 
      this.expectedTimeOfArrival, 
      this.myOrderProducts, 
      this.timer, 
      this.customer,
      this.coupon,
      this.counter,});

  MyOrder.fromJson(dynamic json) {
    dailyNumber = json['daily_number'];
    orderNumber = json['order_number'];
    status = json['status'];
    totalProducts = json['total_products'];
    note = json['note'];
    restaurant = json['restaurant'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    deliveryMethod = json['delivery_method'];
    paymentMethod = json['payment_method'];
    deliveryCost = json['delivery_cost'];
    createdAt = json['created_at'];
    newTime = json['new_time'];
    // preprationTime = json['prepration_time'];
    // readyTime = json['ready_time'];
    inProgressDeliveryTime = json['in_progress_delivery_time'];
    deliveryArrivalTime = json['delivery_arrival_time'].toString();
    doneTime = json['done_time'];
    expectedTimeOfArrival = json['expected_time_of_arrival'];
    customer = Customer.fromJson(json['customer']);
    if (json['products'] != null) {
      myOrderProducts = [];
      json['products'].forEach((v) {
        myOrderProducts?.add(MyOrderProducts.fromJson(v));
      });
    }
    timer = json['timer'] != null ? OrderTimer.fromJson(json['timer']) : null;
    counter = json['counter'];
    coupon = json['coupon'];
  }
  Customer? customer;
  num? dailyNumber;
  num? orderNumber;
  num? status;
  num? coupon;
  num? totalProducts;
  String? note;
  String? restaurant;
  Address? address;
  num? deliveryMethod;
  num? paymentMethod;
  num? deliveryCost;
  String? createdAt;
  String? newTime;
  String? preprationTime;
  int? readyTime;
  int? inProgressDeliveryTime;
  String? deliveryArrivalTime;
  int? doneTime;
  String? expectedTimeOfArrival;
  List<MyOrderProducts>? myOrderProducts;
  OrderTimer? timer;
  dynamic counter;

}