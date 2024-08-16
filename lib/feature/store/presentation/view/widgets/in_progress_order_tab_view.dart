import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InProgressOrderTabView extends StatelessWidget {
  const InProgressOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = HomeCubit.getCubit(context);
        return OrdersVerticalListView(
          hideProgress: true,
          orderList: cubit.allInProgressOrder,
        );
      },
    );
  }
}
