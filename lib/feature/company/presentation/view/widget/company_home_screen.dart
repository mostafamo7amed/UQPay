import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/basic_functions_widget.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_cashback_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_notification_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_offer_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_orders_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4FWr_nYB_swH83rh5u92hGHq80hsCdrnAng&s',
    'https://media-uk-india-banners.landmarkshops.in/Home-Centre/HC-Mobile-2-Offer-060917.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIghsO8g53bPJ45SEsd8doVtKUck0ZYrRbuA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpg0ddGu4guMHQZhktsiywY1UWF4Roh4txInG5GBR5HPQ-TnsNNiBMA5yJ8gYha0xixkQ&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.network(item,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width)),
            ))
        .toList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          titleSpacing: 10,
          leading: const Icon(
            Icons.group,
            size: 28,
          ),
          title: Text(
            'Bateel company',
            style: Styles.textStyle20.copyWith(
                color: AppColor.blackColor, fontWeight: FontWeight.bold),
          ),
           actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(context,
                      screen: const CompanyNotificationView());
                },
                child: const Icon(
                  Icons.notifications_none_outlined,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: AppColor.yellowColor,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: BasicFunctionsWidget(
                                        title: 'Manage offers',
                                        asset: AssetsData.discount,
                                        onTap: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(context,
                                                  screen:
                                                      const CompanyOfferView());
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: BasicFunctionsWidget(
                                        title: 'Manage cachbaks',
                                        asset: AssetsData.cashBack,
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen:
                                                  const CompanyUpdateCashbackView());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: BasicFunctionsWidget(
                                        title: 'Orders',
                                        asset: AssetsData.cartIcon,
                                        onTap: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(context,
                                                  screen:
                                                      const CompanyOrdersView());
                                        },
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
