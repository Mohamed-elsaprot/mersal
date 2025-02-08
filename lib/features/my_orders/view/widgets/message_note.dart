import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/design/app_styles.dart';

class MessageNote extends StatelessWidget {
  const MessageNote({super.key, required this.note});
  final String note;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xffffefd5)
      ),
      padding: const EdgeInsets.all(8),alignment: Alignment.center,
      child: Styles.text(note,size: 12),
    );
  }
}
