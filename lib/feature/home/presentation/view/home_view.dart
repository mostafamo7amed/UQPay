import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/common.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUser(uid)..getAllUsers()..getFastTransferUsers(),
        child: const HomeViewBody()
    );
  }
}