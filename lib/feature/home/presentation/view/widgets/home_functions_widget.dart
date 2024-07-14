import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';

class HomeFunctionsWidget extends StatelessWidget {
  final String title;
  final String asset;
  final onTap;
  final bool isGift;
  const HomeFunctionsWidget({
    super.key,
    this.isGift = false,
    required this.title,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.grayColor,
            radius: 35.5,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: AppColor.wihteColor,
              child: Stack(alignment: Alignment.bottomRight, children: [
                Image.asset(
                  asset,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                if(isGift)
                CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColor.wihteColor,
                  child: Image.asset(
                    AssetsData.sendGiftTrueIcon,
                    height: 8,
                    fit: BoxFit.fill,
                  ),
                ),
              ]),
            ),
          ),
          Text(
            title,
            style: Styles.textStyle12,
          ),
        ],
      ),
    );
  }
}
