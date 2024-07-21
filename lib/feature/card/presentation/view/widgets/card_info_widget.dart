import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class CardInformationWidget extends StatelessWidget {
  const CardInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AssetsData.backgroundVisa,
          height: 240,
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
                      'Mohammad Jassas',
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
                Spacer(),
                Row(
                  children: [
                    Text(
                      '4756',
                      style: Styles.regularTextStyle16
                          .copyWith(color: AppColor.wihteColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(AssetsData.leadingAccount),
                  ],
                ),
                Text(
                  '469.52 SAR',
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
