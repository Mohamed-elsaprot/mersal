import 'package:flutter/material.dart';


class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key, required this.body, required this.size, this.border, this.shadow, this.padding});
  final Widget body;
  final double size;
  final double? padding;
  final BoxBorder? border;
  final bool? shadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      padding: EdgeInsets.all(padding??2),
      decoration: BoxDecoration(
        boxShadow: [
          if(shadow??true)const BoxShadow(color: Colors.black12,offset: Offset(0, 6),blurRadius: 5),
        ],
        shape: BoxShape.circle,
        color: Colors.white,
        border: border??Border.all(color: Colors.green, width: 2,),
      ),
      child: ClipOval(
        child: body,
      ),
    );
  }
}
