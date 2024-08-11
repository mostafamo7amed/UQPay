import 'package:UQPay/feature/login/presentation/manager/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:UQPay/feature/login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..getLocationPermission()..getNotificationPermission(),
      child: LoginViewBody(),
    );
  }
}
