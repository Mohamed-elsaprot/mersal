import 'package:flutter/material.dart';
import 'package:mersal/features/business_screen/model/Restaurant.dart';

import '../../../../core/design/app_styles.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({super.key, required this.restaurant});
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
            child: Styles.text(restaurant.name??'No Name',fontWeight: FontWeight.w900,size: 22)),
        FittedBox(
              fit: BoxFit.scaleDown,
                child: Styles.subTitle(restaurant.description??'No Des ',size: 12)),
        // FittedBox(
        //       fit: BoxFit.scaleDown,
        //         child: Styles.subTitle(restaurant.address??' -------- ',size: 14)),
      ],
    );
  }
}
