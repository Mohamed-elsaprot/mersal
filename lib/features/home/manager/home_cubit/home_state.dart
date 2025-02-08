abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeSuccess extends HomeState {}
class HomeLoading extends HomeState {}
class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure({required this.errorMessage});
}

class AppBannerSuccess extends HomeState {}
class AppBannerLoading extends HomeState {}
class AppBannerFailure extends HomeState {
  final String errorMessage;
  AppBannerFailure({required this.errorMessage});
}
