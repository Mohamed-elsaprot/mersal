import 'package:flutter/material.dart';
import 'package:mersal/core/design/app_styles.dart';

import 'custom_button.dart';

class SecButton extends StatelessWidget {
  const SecButton({super.key, required this.title, required this.fun, this.successScreen=false});
  final String title;
  final  void Function() fun;
  final bool successScreen;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: double.infinity,height: 60,
        child: CustomButton(fun: fun,textSize: 22, title:title,rad: 100,
          textColor: successScreen? Colors.white:Colors.black,
          backGroundColor: successScreen?Colors.transparent:Styles.primaryButtons,
        borderSide: const BorderSide(color: Colors.white,width: 2),
        ));
  }
}
