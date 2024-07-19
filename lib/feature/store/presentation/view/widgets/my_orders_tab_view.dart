import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/all_order_tab_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/in_progress_order_tab_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/past_order_tab_view.dart';
import 'package:flutter/material.dart';

class MyOrdersTabView extends StatefulWidget {
  const MyOrdersTabView({super.key});

  @override
  State<MyOrdersTabView> createState() => _MyOrdersTabViewState();
}

class _MyOrdersTabViewState extends State<MyOrdersTabView> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      height: 40,
                      child: TabBar(
                        onTap: (value) {
                          setState(() {
                            currentTab = value;
                            print('current Tab order ====== $currentTab');
                          });
                        },
                        indicator: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(14)),
                        ),
                        dividerHeight: 0.0,
                        indicatorSize: TabBarIndicatorSize.tab,
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
                              'In progress',
                              style: currentTab != 1
                                  ? Styles.regularTextStyle16
                                      .copyWith(color: AppColor.yellowColor)
                                  : Styles.regularTextStyle16
                                      .copyWith(color: AppColor.wihteColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Past orders',
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
                ),
                const SizedBox(
                  height: 5,
                ),
                const Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      AllOrderTabView(),
                      InProgressOrderTabView(),
                      PastOrderTabView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
