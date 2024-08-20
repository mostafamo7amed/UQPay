import 'package:UQPay/feature/admin/presentation/manager/admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../company/presentation/view/widget/company_notification_item.dart';
import 'admin_recharge_card_screen.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if(state is GetNotificationSuccessState){
          AdminCubit.getCubit(context).notificationClicked();
        }
      },
      builder: (context, state) {
        var cubit = AdminCubit.getCubit(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              titleSpacing: 3,
              title: Text(
                'Notification',
                style: Styles.textStyle24.copyWith(
                    color: AppColor.wihteColor, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.wihteColor,
                ),
              ),
            ),
            body:cubit.allNotification.isNotEmpty? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      cubit.updateNotificationClicks(cubit.allNotification[index]);
                      PersistentNavBarNavigator.pushNewScreen(
                          context, screen: const AdminRechargeCardScreen());
                    },
                    child: NotificationItemWidget(size: MediaQuery.of(context).size, notificationModel:cubit.allNotification[index],),),
              itemCount: cubit.allNotification.length,
            ):const Center(child: Text('There is no Notification yet',style: Styles.textStyle18,),),
          ),
        );
      },
    );
  }
}
