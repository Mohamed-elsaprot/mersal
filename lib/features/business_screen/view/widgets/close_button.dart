import 'package:flutter/material.dart';

import '../../../../core/router.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 30, end: 30,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        radius: 18,
        child: IconButton(
          icon: const Icon(Icons.close, size: 20,),
          onPressed: () {
            AppRouter.router.pop();
          },
        ),
      ),
    );
  }
}
