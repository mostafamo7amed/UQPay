import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../../core/utils/app_manager/app_styles.dart';
import 'card_info_widget.dart';

class LatestOperationView extends StatelessWidget {
  const LatestOperationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 3,
          leading: InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          title: Text(
            'Latest Operations',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CardInformationWidget(),
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    color: AppColor.lightgrayColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Fitness Gym',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: Styles.regularTextStyle16
                                                  .copyWith(
                                                      color:
                                                          AppColor.blackColor),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '25/4/2024',
                                              style: Styles.regularTextStyle14
                                                  .copyWith(
                                                      color:
                                                          AppColor.primaryColor),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          '200 SAR',
                                          style: Styles.regularTextStyle14
                                              .copyWith(
                                                  color: AppColor.primaryColor),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                                AssetsData.containerTransfer),
                                            Image.asset(AssetsData.outTransfer),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 5,
                                ),
                            itemCount: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
