import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/send_gifts_screen.dart';

class GiftListView extends StatelessWidget {
   GiftListView({
    super.key,
    required this.isSend,
  });
  bool isSend = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSend?Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(context, screen: SendGiftsScreen());
            },
            text: 'Send gift',
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ):const SizedBox(),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Stack(
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
                                  'Mohammad Jassas',
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
                              '469.52 SAR',
                              style: Styles.textStyle20
                                  .copyWith(color: AppColor.wihteColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '26-4-2024',
                              style: Styles.textStyle20
                                  .copyWith(color: AppColor.wihteColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: 4),
        ),
      ],
    );
  }
}
