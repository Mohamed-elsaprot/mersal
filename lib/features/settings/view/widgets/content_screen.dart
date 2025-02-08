import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/features/settings/model/ContentPage.dart';

import '../../../../consts.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key, required this.contentPage});

  final ContentPage contentPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Styles.text(contentPage.defaultName??'', size: 25, fontWeight: FontWeight.w900),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical:10.h),
          child: SizedBox(
              width: double.infinity,
              // child: HtmlWidget(contentPage.content??'',textStyle: const TextStyle(fontFamily: fontFamily,),)
              child: Styles.text(contentPage.content??'')
          )),
    );
  }
}


