abstract class MyOrderState {}

final class MyOrderInitial extends MyOrderState {}
final class TimeLoading extends MyOrderState {}
final class TimeSuccess extends MyOrderState {}
final class MyOrderLoading extends MyOrderState {}
final class MyOrderSuccess extends MyOrderState {}
final class MyOrderFailure extends MyOrderState {
  final String errorMessage;
  MyOrderFailure({required this.errorMessage});
}

