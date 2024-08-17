import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/utils/common.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_order_details_view.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyNewOrdersView extends StatelessWidget {
  const CompanyNewOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit = CompanyCubit.getCubit(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child:cubit.newOrders.isNotEmpty?
      ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: CompanyOrderDetailsView(orderModel: cubit.newOrders[index], type: 'new',));
          },
          child:CompanyOrderItem(orderModel: cubit.newOrders[index],),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: cubit.newOrders.length,
      ): const Center(child: Text('There is no order received!',style: Styles.textStyle18,),),
    );
  },
);
  }
}

class CompanyOrderItem extends StatelessWidget {
  const CompanyOrderItem({
    super.key, required this.orderModel,
  });
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.wihteColor,
      elevation: 4,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.3,
                  height: MediaQuery.of(context).size.width / 4.3,
                  decoration:  BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: orderModel.products!.image!.isNotEmpty?
                        NetworkImage(orderModel.products!.image!)
                            :NetworkImage(noImagePlaceholder),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Order #${orderModel.orderNumber}',
                      style: Styles.textStyle20
                          .copyWith(color: AppColor.blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Order amount',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                          const Spacer(),
                          Text(
                            '${orderModel.total} SAR',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Order type',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                          const Spacer(),
                          Text(
                            '${orderModel.orderType}',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            'Date',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                          const Spacer(),
                          Text(
                            '${orderModel.date}',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
