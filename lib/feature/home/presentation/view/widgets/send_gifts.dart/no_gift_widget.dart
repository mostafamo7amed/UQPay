import 'package:flutter/material.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

class NoGiftWidget extends StatelessWidget {
  const NoGiftWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Every occasion is an opportunity',
          style: Styles.textStyle20.copyWith(color: AppColor.yellowColor),
        ),
        Text(
          'to unwrap the happiness,',
          style: Styles.textStyle20.copyWith(color: AppColor.yellowColor),
        ),
        Text(
          'spread the joy, and send gifts',
          style: Styles.textStyle20.copyWith(color: AppColor.yellowColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(AssetsData.giftIcon),
      ],
    );
  }
}