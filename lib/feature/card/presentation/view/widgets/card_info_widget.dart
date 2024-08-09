import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class CardInformationWidget extends StatelessWidget {
  const CardInformationWidget({
    super.key,
    required this.userModel,
    this.showCardNumber = false,
  });
  final UserModel userModel;
  final bool? showCardNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height:200 ,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(

            AssetsData.backgroundVisa,

            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      userModel.name!,
                      style: Styles.textStyle24
                          .copyWith(color: AppColor.wihteColor),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: AppColor.wihteColor,
                    )
                  ],
                ),
                const Spacer(),
                showCardNumber==false?
                Row(
                  children: [
                    Text(
                      userModel.cardNumber!.substring(0,4),
                      style: Styles.regularTextStyle16
                          .copyWith(color: AppColor.wihteColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(AssetsData.leadingAccount,),
                  ],
                ): Row(
                  children: [
                    Text(
                      '${userModel.cardNumber!.substring(0,4)} ${userModel.cardNumber!.substring(4,8)} ${userModel.cardNumber!.substring(8,12)}  ${userModel.cardNumber!.substring(12,16)}',
                      style: Styles.regularTextStyle16
                          .copyWith(color: AppColor.wihteColor),
                    ),
                  ],
                ),
                Text(
                  '${userModel.cardAmount!} SAR',
                  style:
                      Styles.textStyle24.copyWith(color: AppColor.wihteColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
