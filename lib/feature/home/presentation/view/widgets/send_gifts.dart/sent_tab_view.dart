import 'package:flutter/material.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/gift_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/cubit/home_cubit.dart';
import '../../../manager/cubit/home_state.dart';

class SentTabView extends StatelessWidget {
  const SentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeCubit.getCubit(context);
        return GiftListView( isSend: true, gifts: cubit.allSendGifts,);
      },
    );
  }
}