import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/deposit_machines.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/home_functions_widget.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/save_account/save_account_view.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/send_gifts.dart/send_gifts_view.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/transfer/transfer_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    AssetsData.offer,
    AssetsData.offer,
    AssetsData.offer,
    AssetsData.offer,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(item,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width)),
            ))
        .toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 3,
          leading: const Icon(
            Icons.person_outlined,
            size: 28,
          ),
          title: const Text(
            'Good evning ,Muhammad',
            style: Styles.boldTextStyle16,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 28,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.5,
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
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .7,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(AssetsData.empityVisa),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 45.0, right: 45.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Mohammad Jassas',
                                    style: Styles.textStyle24
                                        .copyWith(color: AppColor.wihteColor),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.star,
                                    color: AppColor.wihteColor,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Current account',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.wihteColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '4756',
                                    style: Styles.regularTextStyle16
                                        .copyWith(color: AppColor.wihteColor),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(AssetsData.leadingAccount),
                                ],
                              ),
                              Text(
                                '\$469.52',
                                style: Styles.textStyle24
                                    .copyWith(color: AppColor.wihteColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeFunctionsWidget(
                            title: 'Save account',
                            asset: AssetsData.saveAccountIcon,
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: const SaveAccountView());
                            },
                          ),
                          HomeFunctionsWidget(
                            title: 'Send gift',
                            asset: AssetsData.sendGiftIcon,
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: const SendGiftsView());
                            },
                          ),
                          HomeFunctionsWidget(
                            title: 'Transfar',
                            asset: AssetsData.transferIcon,
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: TransferView());
                              
                            },
                          ),
                          HomeFunctionsWidget(
                            title: 'Deposit',
                            asset: AssetsData.placeHolderIcon,
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: const DepositMachines());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
