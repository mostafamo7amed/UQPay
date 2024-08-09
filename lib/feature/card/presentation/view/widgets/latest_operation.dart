import 'package:UQPay/core/functions/get_operation_date_now.dart';
import 'package:UQPay/feature/home/data/models/operation.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../home/data/models/user_model.dart';
import 'card_info_widget.dart';

class LatestOperationView extends StatelessWidget {
  const LatestOperationView({super.key,required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit = HomeCubit.getCubit(context);
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
                         Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CardInformationWidget(userModel: userModel ,),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              getOperationDateNow(),
                              style: Styles.regularTextStyle14
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        cubit.allOperation.isNotEmpty?
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => OperationItem(userModel: userModel,
                              operation: cubit.allOperation[index],
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 5,
                                ),
                            itemCount: cubit.allOperation.length):
                        const Center(child: Text('There is no operation yet',style: Styles.textStyle18,),),
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
  },
);
  }
}

class OperationItem extends StatelessWidget {
  const OperationItem({
    super.key,
    required this.operation,
    required this.userModel,
  });

  final Operation operation;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      operation.operationName!,
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
                      operation.date!,
                      style: Styles.regularTextStyle14
                          .copyWith(
                              color: AppColor
                                  .primaryColor),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      '${operation.operationAmount} SAR',
                      style: Styles.regularTextStyle16
                          .copyWith(
                              color: AppColor
                                  .primaryColor),
                    ),
                    Text(
                      '${(userModel.cardAmount!)-(operation.operationAmount!)} SAR',
                      style: Styles.regularTextStyle14
                          .copyWith(
                              color: AppColor
                                  .primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                        AssetsData.containerTransfer),
                    Image.asset(operation.type=="Receive"
                        ?AssetsData.inTransfer: AssetsData.outTransfer),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
