import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddonsCounterButton extends StatelessWidget {
  const AddonsCounterButton({super.key, required this.fun, required this.image, this.imageAlign=Alignment.center});
  final void Function() fun;
  final String image;
  final AlignmentGeometry imageAlign;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        color: Colors.transparent,
        width: 35.w,
        alignment: imageAlign,
        child: Image.asset(image,width: 20,),
      ),
    );
  }
}
