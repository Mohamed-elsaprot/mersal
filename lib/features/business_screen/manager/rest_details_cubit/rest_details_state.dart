abstract class RestDetailsState {}

final class RestDetailsInitial extends RestDetailsState {}
final class RestDetailsLoading extends RestDetailsState {}
final class RestDetailsSuccess extends RestDetailsState {}
final class RestDetailsFailure extends RestDetailsState {
  RestDetailsFailure(this.errorMessage);
  final String errorMessage;
}
