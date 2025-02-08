import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/business_screen/view/widgets/rounded_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/design/app_styles.dart';
import '../../model/RestDetailsModel.dart';

class ContactsRow extends StatelessWidget {
  const ContactsRow({super.key, required this.restDetailsModel});
  final RestDetailsModel restDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedContainer(
            borderColor: const Color(0xff68c939), color:  Colors.grey.shade100,
            padding: const EdgeInsetsDirectional.only(start: 12),
            body: Row(
              children: [
                Styles.text('14:00-11:00',color: Colors.black,size: 9),
                const SizedBox(width: 4,),
                RoundedContainer(
                  borderColor: Colors.transparent, color: const Color(0xff68c939),
                  body: Styles.text('مفتوح'.tr(),color: Colors.white,size: 9),
                ),
              ],
            )
        ),
        const SizedBox(width: 6,),
        GestureDetector(
          onTap: () async {
            if(restDetailsModel.restaurant!.coordinates!.length>=2) {
              final Uri link = Uri.parse('https://waze.com/ul?ll=${restDetailsModel.restaurant!.coordinates![0]},${restDetailsModel.restaurant!.coordinates![1]}&navigate=yes');
              bool valid = await canLaunchUrl(link);
              if (valid) {
                await launchUrl(link);
              }
            }
          },
          child: RoundedContainer(
              borderColor: Styles.primary, color:  Styles.primary,
              padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 1.5.h),
              body: Styles.text('ويز',color: Colors.white,size: 9)
          ),
        ),
        const SizedBox(width: 6,),
        GestureDetector(
          onTap: ()async{
            final Uri phoneNum = Uri.parse('tel:${restDetailsModel.restaurant!.phone??000}');
            bool x = await canLaunchUrl(phoneNum);
            if (x) {
              await launchUrl(phoneNum);
            }
          },
          child: RoundedContainer(
              borderColor: Colors.black, color:  Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 1.5.h),
              body: Styles.text('اتصال'.tr(),color: Colors.white,size: 9)
          ),
        ),

      ],
    );
  }
}
