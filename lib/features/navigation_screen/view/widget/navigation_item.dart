import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/design/app_styles.dart';

abstract class NavigationItem {
  static CustomNavigationBarItem item({required IconData icon,required String title}){
    return CustomNavigationBarItem(
        icon: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,size: 22,color: Colors.black,),
              const SizedBox(height: 3,),
              FittedBox(child: Styles.text(title,size: 10,)),
            ],
          ),
        ),
        selectedIcon: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,size: 20,color: Styles.primary,),
                  const SizedBox(height: 3,),
                  Styles.text(title,color: Styles.primary,size: 9),
                ],
              ),
            ),
            CircleAvatar(radius: 65,backgroundColor: Styles.primary.withOpacity(.14),)
          ],
        ),
    );
  }
}

