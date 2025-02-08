import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/fun_widgets.dart';
import '../../manager/home_cubit/home_cubit.dart';

class AdsSlider extends StatelessWidget {
  const AdsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = BlocProvider.of<HomeCubit>(context);
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: homeCubit.appBannerList.length,
        itemBuilder: (context, index, realIndex) {
          return cachedImage(homeCubit.appBannerList[index].image??'',);
          // appBanner
        },
        options: CarouselOptions(
            height: 250.h,
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayCurve: Curves.easeInOutCubic,
            reverse: true,
            onPageChanged: (x, _) {}
        ),
      ),
    );
  }
}
