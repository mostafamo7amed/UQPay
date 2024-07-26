import 'package:flutter/material.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

class BasicFunctionsWidget extends StatelessWidget {
  final String title;
  final String? asset;
  final IconData? icon;
  final onTap;
  final bool isGift;
  final Color? backgroundColor;
  final Color? stokeColor;
  const BasicFunctionsWidget({
    super.key,
    this.backgroundColor = Colors.white,
    this.stokeColor = Colors.grey,
    this.isGift = false,
    this.icon,
    required this.title,
    this.asset,
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
            backgroundColor: stokeColor ?? AppColor.grayColor,
            radius: 35.5,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: backgroundColor ?? AppColor.wihteColor,
              child: Stack(alignment: Alignment.bottomRight, children: [
                asset != null
                    ? Image.asset(
                        asset!,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        icon,
                        color: AppColor.grayColor,
                        size: 30,
                      ),
                if (isGift)
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
          const SizedBox(
            height: 5,
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
