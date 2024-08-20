import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/home/data/models/notification.dart';
import 'package:flutter/material.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
    required this.size,
    required this.notificationModel,
  });

  final Size size;
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      color: notificationModel.isOpened==false?AppColor.wihteColor:AppColor.wihteColor.withOpacity(.9),
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width / 4.3,
                height: size.width / 4.3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: notificationModel.notifyType=='Order'?
                       NetworkImage(notificationModel.image!)
                          :const AssetImage(AssetsData.appLogo)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificationModel.title!,
                      style: Styles.regularTextStyle16
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      notificationModel.message!,
                      style: Styles.regularTextStyle14
                          .copyWith(color: AppColor.lightgrayColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          '${notificationModel.dateTime}',
                          style: Styles.regularTextStyle14
                              .copyWith(color: AppColor.lightgrayColor),
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if(notificationModel.isOpened==false)
                        Container(
                          margin: const EdgeInsets.all(8),
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
