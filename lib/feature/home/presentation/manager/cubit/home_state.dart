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

final class HomeEditTargetLoadingState extends HomeState {}
final class HomeEditTargetSuccessState extends HomeState {}
final class HomeEditTargetErrorState extends HomeState {}

final class HomeDeleteTargetSuccessState extends HomeState {}
final class HomeDeleteTargetErrorState extends HomeState {}

final class HomeChangeSelectedNameState extends HomeState {}

final class HomeChangeSelectedFastTransferUserState extends HomeState {}


final class HomeGetTargetLoadingState extends HomeState {}
final class HomeGetTargetSuccessState extends HomeState {}
final class HomeGetTargetErrorState extends HomeState {}

final class HomeAllGetUserLoadingState extends HomeState {}
final class HomeAllGetUserSuccessState extends HomeState {}
final class HomeAllGetUserErrorState extends HomeState {}

final class HomeTransferLoadingState extends HomeState {}
final class HomeTransferSuccessState extends HomeState {}
final class HomeTransferErrorState extends HomeState {}

final class HomeUpdateMoneySuccessState extends HomeState {}
final class HomeUpdateMoneyErrorState extends HomeState {}

final class HomeAddFastTransferLoadingState extends HomeState {}
final class HomeAddFastTransferSuccessState extends HomeState {}
final class HomeAddFastTransferErrorState extends HomeState {}

final class HomeGetFastTransferSuccessState extends HomeState {}
final class HomeGetFastTransferErrorState extends HomeState {}

final class HomeGetUserOperationSuccessState extends HomeState {}
final class HomeGetUserOperationErrorState extends HomeState {}

final class HomeChangeGiftAmountState extends HomeState {}
final class HomeChangeGiftMessageState extends HomeState {}
final class HomeChangeGiftNameState extends HomeState {}

final class HomeSendGiftLoadingState extends HomeState {}
final class HomeSendGiftSuccessState extends HomeState {}
final class HomeSendGiftErrorState extends HomeState {}

final class HomeGetGiftLoadingState extends HomeState {}
final class HomeGetGiftSuccessState extends HomeState {}
final class HomeGetGiftErrorState extends HomeState {}

final class HomeGetAllStudentSuccessState extends HomeState {}
final class HomeGetAllStudentErrorState extends HomeState {}
