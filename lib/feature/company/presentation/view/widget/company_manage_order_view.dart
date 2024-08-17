import 'package:UQPay/feature/company/presentation/view/widget/company_all_order_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_new_orders_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_past_orders_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/my_orders_tab_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyManageOrderView extends StatefulWidget {
  const CompanyManageOrderView({super.key});

  @override
  State<CompanyManageOrderView> createState() => _SendGiftsViewState();
}

class _SendGiftsViewState extends State<CompanyManageOrderView> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
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
              'Orders',
              style: Styles.textStyle24.copyWith(
                  color: AppColor.wihteColor, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(24), topEnd: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      child: TabBar(
                        onTap: (value) {
                          setState(() {
                            currentTab = value;
                            print('current Tab ====== $currentTab');
                          });
                        },
                        indicator: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerHeight: 0,
                        tabs: [
                          Tab(
                            child: Text(
                              'All',
                              style: currentTab != 0
                                  ? Styles.regularTextStyle16
                                  .copyWith(color: AppColor.yellowColor)
                                  : Styles.regularTextStyle16
                                  .copyWith(color: AppColor.wihteColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'New',
                              style: currentTab != 1
                                  ? Styles.regularTextStyle16
                                  .copyWith(color: AppColor.yellowColor)
                                  : Styles.regularTextStyle16
                                  .copyWith(color: AppColor.wihteColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Past',
                              style: currentTab != 2
                                  ? Styles.regularTextStyle16
                                  .copyWith(color: AppColor.yellowColor)
                                  : Styles.regularTextStyle16
                                  .copyWith(color: AppColor.wihteColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [CompanyAllOrderView(),CompanyNewOrdersView(), CompanyPastOrdersView()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
