part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginObscureChangedState extends LoginState {}
final class LoginSuccessState extends LoginState {
  String uid;
  LoginSuccessState(this.uid);
}
final class LoginLoadingState extends LoginState {}
final class LoginErrorState extends LoginState {}
class LoginNavigateState extends LoginState {}
