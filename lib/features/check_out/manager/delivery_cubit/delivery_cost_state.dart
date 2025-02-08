abstract class DeliveryCostState {}

final class DeliveryCostInitial extends DeliveryCostState {}
final class DeliveryCostLoading extends DeliveryCostState {}
final class DeliveryCostSuccess extends DeliveryCostState {}
final class DeliveryCostFailure extends DeliveryCostState {
  final String errorMessage;
  DeliveryCostFailure({required this.errorMessage});
}
