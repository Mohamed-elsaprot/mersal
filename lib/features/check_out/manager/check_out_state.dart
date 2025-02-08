abstract class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}
final class CheckOutLoading extends CheckOutState {}
final class CheckOutSuccess extends CheckOutState {}
final class CheckOutFailure extends CheckOutState {
  final String errorMessage;
  CheckOutFailure({required this.errorMessage});
}

final class ChangeCashQuote extends CheckOutState {}

