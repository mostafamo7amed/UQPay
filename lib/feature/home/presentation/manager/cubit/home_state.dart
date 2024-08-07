abstract class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeGetUserLoadingState extends HomeState {}
final class HomeGetUserSuccessState extends HomeState {}
final class HomeGetUserErrorState extends HomeState {}
final class HomeGetUserLocationState extends HomeState {}
final class HomeChangeCameraPositionState extends HomeState {}
final class HomeCalculateTargetState extends HomeState {}

final class HomeAddTargetLoadingState extends HomeState {}
final class HomeAddTargetSuccessState extends HomeState {}
final class HomeAddTargetErrorState extends HomeState {}

