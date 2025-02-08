import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mersal/core/local_storage/model/cart_product.dart';
import '../../../core/local_storage/hive_services.dart';
import '../../../core/local_storage/model/OrderModel.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  var orderBox = Hive.box<OrderModel>(orderModelHiveKey);

  OrderModel orderModel= OrderModel(products: [],restId: '',note: '');
  num cartTotal=0;

  bool setRestId({required String id}){
    bool x = false;
    if(orderModel.restId=='') {
      x=true;orderModel.restId = id;
      orderBox.isNotEmpty? orderBox.putAt(0, orderModel):orderBox.add(orderModel);
      return x;
    }
    if(orderModel.products!.isEmpty){
      x =true;orderModel.restId = id;
      orderBox.isNotEmpty? orderBox.putAt(0, orderModel):orderBox.add(orderModel);
      return x;
    }
    if(orderModel.restId==id){
      x=true;
    }
    return x;
  }

  getCachedOrder()async{
    // await orderBox.clear();
    if(orderBox.isNotEmpty){
      orderModel  = orderBox.getAt(0)!;
      calcTotal();
    }
  }

  Future<void> addToCart(CartProduct cartProduct) async {
    String checkText='${cartProduct.productId}${cartProduct.sizeId}';
    for (var x in cartProduct.comprehensiveExtras!) {checkText+=x.extraId.toString();}
    for (var x in cartProduct.extras!) {checkText+='${x.extraId}${x.quantity}${x.groupId}';}

    if(orderModel.products!.isNotEmpty){
      t1 : for (int i=0; i<orderModel.products!.length;i++) {
        String text2='${orderModel.products![i].productId}${orderModel.products![i].sizeId}';
        for (var x in orderModel.products![i].comprehensiveExtras!) {text2+=x.extraId.toString();}
        for (var x in orderModel.products![i].extras!) {text2+='${x.extraId}${x.quantity}${x.groupId}';}

        if(checkText==text2){
          orderModel.products![i].quantity=orderModel.products![i].quantity! + cartProduct.quantity!;
          break t1;
        }else{
          if(i == orderModel.products!.length-1) {
            orderModel.products!.add(cartProduct);
            break t1;
          }
        }
      }
    }else{
      orderModel.products!.add(cartProduct);
    }
    orderBox.isNotEmpty? await orderBox.putAt(0, orderModel):await orderBox.add(orderModel);
    calcTotal();
  }

  updateProduct({required CartProduct pro,required int index,required bool add}) async {
    if(add){
      pro.quantity = pro.quantity!+1;
    }else{
      if(pro.quantity!=1){
        pro.quantity = pro.quantity!-1;
      }else{
        orderModel.products!.removeAt(index);
        await orderBox.putAt(0, orderModel);
      }
    }
    calcTotal();
  }

  calcTotal(){
    cartTotal = 0;
    for (var pro in orderModel.products!) {
      cartTotal+=(pro.addonsSum!+pro.selectedSize!.price!)*pro.quantity!;
    }
    emit(CartChange());
  }

  resetOrder()async{
    orderModel= OrderModel(products: [],);
    orderModel.restId='';
    cartTotal=0;
    orderModel.note='';
    orderModel.coupon=null;
    await orderBox.putAt(0, orderModel);
  }
}
