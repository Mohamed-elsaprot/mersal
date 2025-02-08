abstract class UserDataState {}

final class UserDataInitial extends UserDataState {}
final class UserDataSuccess extends UserDataState {}
final class UserDataLoading extends UserDataState {}
final class UserDataFailure extends UserDataState {
  final String errorMessage;
  UserDataFailure({required this.errorMessage});
}
