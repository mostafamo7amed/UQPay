import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../card/presentation/view/cards_screen.dart';
import '../../../card/presentation/view/widgets/latest_operation.dart';
import '../../../company/presentation/view/widget/company_notification_item.dart';
import '../../../store/presentation/view/store_screen.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is HomeGetNotificationSuccessState){
          HomeCubit.getCubit(context).notificationClicked();
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.getCubit(context);
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
              body:cubit.allNotification.isNotEmpty? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: () {
                        cubit.updateNotificationClicks(cubit.allNotification[index]);
                        if(cubit.allNotification[index].notifyType=='Order') {
                          PersistentNavBarNavigator.pushNewScreen(context, screen: const StoreScreen() );
                        }else if(cubit.allNotification[index].notifyType=='Gift'||cubit.allNotification[index].notifyType=='Transfer'){
                          PersistentNavBarNavigator.pushNewScreen(context, screen: LatestOperationView(userModel: cubit.userModel!,));
                        }else if(cubit.allNotification[index].notifyType=='Recharge'){
                          PersistentNavBarNavigator.pushNewScreen(context, screen: const CardsScreen());
                        }else{
                          Navigator.pop(context);
                        }

                      },
                      child: NotificationItemWidget(size: MediaQuery
                          .of(context)
                          .size, notificationModel:cubit.allNotification[index],),),
                itemCount: cubit.allNotification.length,
              ):const Center(child: Text('There is no Notification yet',style: Styles.textStyle18,),),
            ));
      },
    );
  }
}
