import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_manage_order_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyNotificationView extends StatelessWidget {
  const CompanyNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if(state is GetNotificationSuccessState){
          CompanyCubit.getCubit(context).notificationClicked();
        }
      },
      builder: (context, state) {
        var cubit = CompanyCubit.getCubit(context);
        return SafeArea(
          child: Scaffold(
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
                'Notifications',
                style: Styles.textStyle24.copyWith(
                    color: AppColor.wihteColor, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  InkWell(
                      onTap: () {
                        cubit.getCompanyOrders();
                        cubit.updateNotificationClicks(cubit.allCompanyNotification[index]);
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: const CompanyManageOrderView());
                      },
                      child:NotificationItemWidget(
                          size: MediaQuery.of(context).size,
                          notificationModel: cubit.allCompanyNotification[index]),
                  ),
              //(size: MediaQuery.of(context).size)),
              itemCount: cubit.allCompanyNotification.length,
            ),
          ),
        );
      },
    );
  }
}
