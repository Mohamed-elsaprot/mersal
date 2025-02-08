import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/check_out/data/check_out_repo.dart';

import 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit(this.repo) : super(CouponInitial());
  final CheckOutRepo repo;
  num couponDiscount = 0, minCart=0;

  getDiscount({required String resId, required String coupon}) async {
    emit(CouponLoading());
    var res = await repo.coupon(resId: resId, coupon: coupon);
    res.fold((failure) {
      emit(CouponFailure(errorMessage: failure.errorMessage));
    }, (map) {
      if(map['cost']!=null)couponDiscount=map['cost'];
      if(map['min_cart']!=null)minCart = map['min_cart'];
             emit(CouponSuccess());
        }
    );
  }
}
