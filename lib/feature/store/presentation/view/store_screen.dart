import 'package:UQPay/feature/store/presentation/view/widgets/my_orders_tab_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _SendGiftsViewState();
}

class _SendGiftsViewState extends State<StoreScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,
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
                              'Stores',
                              style: currentTab != 0
                                  ? Styles.regularTextStyle16
                                      .copyWith(color: AppColor.yellowColor)
                                  : Styles.regularTextStyle16
                                      .copyWith(color: AppColor.wihteColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'My Orders',
                              style: currentTab != 1
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
                      children: [StoreTabView(), MyOrdersTabView()],
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
