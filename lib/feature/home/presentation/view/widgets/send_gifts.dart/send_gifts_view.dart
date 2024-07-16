import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/send_gifts.dart/received_tab_view.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/send_gifts.dart/sent_tab_view.dart';

class SendGiftsView extends StatefulWidget {
  const SendGiftsView({super.key});

  @override
  State<SendGiftsView> createState() => _SendGiftsViewState();
}

class _SendGiftsViewState extends State<SendGiftsView> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
              'Send Gift',
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
                color: AppColor.wihteColor,
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(24), topEnd: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 35,
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
                        dividerColor: AppColor.yellowColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            child: Text(
                              'Received',
                              style: currentTab != 0
                                  ? Styles.regularTextStyle16
                                      .copyWith(color: AppColor.yellowColor)
                                  : Styles.regularTextStyle16
                                      .copyWith(color: AppColor.wihteColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Sent',
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
                      children: [
                        ReceivedTabView(),
                        SentTabView(),
                      ],
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
