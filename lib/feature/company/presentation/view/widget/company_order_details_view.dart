import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyOrderDetailsView extends StatelessWidget {
  const CompanyOrderDetailsView({super.key, required this.orderModel, required this.type});
  final OrderModel orderModel;
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
  listener: (context, state) {
    if(state is AcceptOrderSuccessState || state is RejectOrderSuccessState || state is FinishOrderSuccessState){
      CompanyCubit.getCubit(context).getCompanyOrders();
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    var cubit = CompanyCubit.getCubit(context);
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
            'Order Details',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .9,
          decoration: BoxDecoration(
            color: AppColor.wihteColor,
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(24), topEnd: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Order #${orderModel.orderNumber}',
                    style:
                        Styles.textStyle24.copyWith(color: AppColor.blackColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Customer name',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          orderModel.userModel!.name!,
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Product',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          orderModel.products!.name!,
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Order type',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '${orderModel.orderType}',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Date',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '${orderModel.date}',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Amount',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '${orderModel.amount} SAR',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'Offer',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '${orderModel.offer} %',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  SeparatedLine(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Row(
                      children: [
                        Text(
                          'Total',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '${orderModel.total} SAR',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if(orderModel.status == 'In Progress')
                      CustomButton(
                        onPressed: () {
                          cubit.acceptOrder(orderModel.orderNumber!, orderModel.userModel!, orderModel.amount!, orderModel.offer!);
                        },
                        color: AppColor.greenColor,
                        text: 'Accept',
                        isLoading: state is AcceptOrderLoadingState,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      if(orderModel.status == 'In Progress')
                      CustomButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Center(
                                        child: Text(
                                          "Are you sure you want \nreject order?!",
                                          textAlign:
                                          TextAlign.center,
                                          style: Styles.textStyle20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SeparatedLine(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: CustomButton(
                                          onPressed: () {
                                            cubit.rejectOrder(orderModel.orderNumber!, orderModel.userModel!);
                                            Navigator.pop(context);
                                          },
                                          width: MediaQuery.of(context).size.width / 4,
                                          color: AppColor.redColor,
                                          text: 'Reject',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        color: AppColor.redColor,
                        text: 'Reject',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      if(orderModel.status != 'In Progress')
                      CustomButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Center(
                                        child: Text(
                                          "Are you sure you want \n finish order?!",
                                          textAlign:
                                          TextAlign.center,
                                          style: Styles.textStyle20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SeparatedLine(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: CustomButton(
                                          onPressed: () {
                                            cubit.finishOrder(orderModel.orderNumber!, orderModel.userModel!);
                                            Navigator.pop(context);
                                          },
                                          width: MediaQuery.of(context).size.width / 4,
                                          color: AppColor.redColor,
                                          text: 'Finish',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        color: AppColor.primaryColor,
                        text: 'Finish',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
