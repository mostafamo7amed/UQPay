import 'package:UQPay/feature/home/data/models/operation.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/send_gifts_screen.dart';

import '../../../../../../core/functions/toast.dart';

class GiftListView extends StatelessWidget {
   GiftListView({
    super.key,
    required this.isSend,
     required this.gifts
  });
  bool isSend = true;
  List<Operation> gifts;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit = HomeCubit.getCubit(context);
    return Column(
      children: [
        isSend?Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            onPressed: () {
              if(cubit.isCardStop==false) {
                PersistentNavBarNavigator.pushNewScreen(
                    context, screen: SendGiftsScreen());
              }else{
                toast(message: 'Card is Paused temporarily\n check your card settings and try again', data: ToastStates.warning);
              }
            },
            text: 'Send gift',
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ):const SizedBox(),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => GiftItem(giftOperation: gifts[index], isSend: isSend,),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: gifts.length),
        ),
      ],
    );
  },
);
  }
}

class GiftItem extends StatelessWidget {
  const GiftItem({
    super.key,
    required this.giftOperation,
    required this.isSend,
  });
  final Operation giftOperation;
  final bool isSend;

  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                AssetsData.backgroundVisa,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${isSend?'To:':'From:'} ${isSend?giftOperation.receiverName:giftOperation.senderName}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Styles.textStyle24
                            .copyWith(color: AppColor.wihteColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${giftOperation.operationAmount} SAR',
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.wihteColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${giftOperation.date}',
                    style: Styles.textStyle20
                        .copyWith(color: AppColor.wihteColor),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
