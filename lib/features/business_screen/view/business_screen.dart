import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/features/business_screen/manager/bar_animation_cubit/bar_animation_cubit.dart';
import 'package:mersal/features/business_screen/view/widgets/business_screen_body.dart';
import 'package:mersal/features/business_screen/view/widgets/business_shimmer.dart';

import '../data/rest_details_repo.dart';
import '../manager/rest_details_cubit/rest_details_cubit.dart';
import '../manager/rest_details_cubit/rest_details_state.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key, required this.restId});
  final String restId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RestDetailsCubit(RestDetailsRepo())..getRestDetails(restId: restId)),
        BlocProvider(create: (context)=> BarAnimationCubit())
      ],
      child: BlocConsumer<RestDetailsCubit,RestDetailsState>(
          builder: (context,state){
            if(state is RestDetailsSuccess){
              return const BusinessScreenBody();
            }else{
              return const BusinessShimmer();
            }
          }, listener: (context,state){
            if(state is RestDetailsFailure) customDialog(context: context, message: state.errorMessage);
      }),
    );
  }
}
