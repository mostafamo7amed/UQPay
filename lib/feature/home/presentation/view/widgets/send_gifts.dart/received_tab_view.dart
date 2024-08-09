import 'package:flutter/material.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/gift_list_view.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/no_gift_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/cubit/home_cubit.dart';
import '../../../manager/cubit/home_state.dart';

class ReceivedTabView extends StatelessWidget {
  const ReceivedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeCubit.getCubit(context);
        return cubit.isReceivedGift?
        GiftListView( isSend: false, gifts: cubit.allReceivedGifts,): const NoGiftWidget();
      },
    );
  }
}
