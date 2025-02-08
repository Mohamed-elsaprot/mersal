import 'package:hive_flutter/hive_flutter.dart';
import 'package:mersal/core/local_storage/model/cart_product_size.dart';

import 'model/ComprehensiveExtras.dart';
import 'model/Extras.dart';
import 'model/OrderModel.dart';
import 'model/cart_product.dart';

const cartProductHiveKey ='cartProductHiveKey';
const comExtraHiveKey  ='comExtraHiveKey';
const extraHiveKey  ='extraHiveKey';
const orderModelHiveKey  ='orderModelHiveKey';
const sizeModelHiveKey  ='sizeModelHiveKey';

Future<void> openHiveBoxes()async{
  Hive.registerAdapter(OrderModelAdapter());
  Hive.registerAdapter(ExtrasAdapter());
  Hive.registerAdapter(CartProductSizeAdapter());
  Hive.registerAdapter(ComprehensiveExtrasAdapter());
  Hive.registerAdapter(CartProductAdapter());

  await Hive.openBox<OrderModel>(orderModelHiveKey,);
  await Hive.openBox<Extras>(extraHiveKey,);
  await Hive.openBox<ComprehensiveExtras>(comExtraHiveKey,);
  await Hive.openBox<CartProductSize>(sizeModelHiveKey,);
  await Hive.openBox<CartProduct>(cartProductHiveKey,);


}