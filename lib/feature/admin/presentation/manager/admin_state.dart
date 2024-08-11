part of 'admin_cubit.dart';

abstract class AdminState {}

final class AdminInitial extends AdminState {}

final class GetAdminLoading extends AdminState {}
final class GetAdminSuccessState extends AdminState {}
final class GetAdminErrorState extends AdminState {}

final class SelectCategoryState extends AdminState {}

final class ObscureChangedState extends AdminState{}

final class UpdateAdminTokenSuccessState extends AdminState {}
final class UpdateAdminTokenErrorState extends AdminState {}

final class PikCompanyImageSuccessState extends AdminState {}
final class PikCompanyImageErrorState extends AdminState {}

final class UploadCompanyImageSuccessState extends AdminState {}
final class UploadCompanyImageErrorState extends AdminState {}

final class PikCategoryImageSuccessState extends AdminState {}
final class PikCategoryImageErrorState extends AdminState {}

final class UploadCategoryImageSuccessState extends AdminState {}
final class UploadCategoryImageErrorState extends AdminState {}

final class AddMachineLoadingState extends AdminState {}

final class AddCategoryLoadingState extends AdminState {}
final class AddCategorySuccessState extends AdminState {}
final class AddCategoryErrorState extends AdminState {}

final class GetCategorySuccessState extends AdminState {}
final class GetCategoryErrorState extends AdminState {}

final class AddMachineSuccessState extends AdminState {}
final class AddMachineErrorState extends AdminState {}

final class RegisterCompanyErrorState extends AdminState {}
final class RegisterCompanySuccessState extends AdminState {}
final class RegisterCompanyLoadingState extends AdminState {}

final class UpdateMoneyLoadingState extends AdminState {}
final class UpdateMoneySuccessState extends AdminState {}
final class UpdateMoneyErrorState extends AdminState {}

final class ReLoginSuccessState extends AdminState {
  String uid;
  ReLoginSuccessState(this.uid);
}
final class ReLoginErrorState extends AdminState {}

final class AddCompanySuccessState extends AdminState {}
final class AddCompanyErrorState extends AdminState {}


final class GetCompanySuccessState extends AdminState {}
final class GetCompanyErrorState extends AdminState {}

final class GetNotificationSuccessState extends AdminState {}
final class GetNotificationErrorState extends AdminState {}

final class GetAllUsersSuccessState extends AdminState {}
final class GetAllUsersErrorState extends AdminState {}

final class SelectUserToRechargeLoadingState extends AdminState {}

final class SelectUserToRechargeState extends AdminState {}



