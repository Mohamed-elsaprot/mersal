abstract class CouponState {}

final class CouponInitial extends CouponState {}
final class CouponLoading extends CouponState {}
final class CouponSuccess extends CouponState {}
final class CouponFailure extends CouponState {
  final String errorMessage;
  CouponFailure({required this.errorMessage});
}
