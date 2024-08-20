import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/widgets/basic_functions_widget.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/home/presentation/view/notification_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/common.dart';
import '../../../../card/presentation/view/widgets/card_info_widget.dart';
import '../../../../card/presentation/view/widgets/view_card_info.dart';
import 'deposit_machines.dart';
import 'save_account/save_account_view.dart';
import 'send_gifts.dart/send_gifts_view.dart';
import 'transfer/transfer_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeGetUserSuccessState) {
          HomeCubit.getCubit(context).getUserTargets(uid);
          HomeCubit.getCubit(context).getAllUsers();
          HomeCubit.getCubit(context).getFastTransferUsers();
          HomeCubit.getCubit(context).getUserOperation();
          HomeCubit.getCubit(context).getAllGifts();
          HomeCubit.getCubit(context).getAdmin();
          HomeCubit.getCubit(context).getAllCategory();
          HomeCubit.getCubit(context).getAllCompany();
          HomeCubit.getCubit(context).getAllStudents();
          HomeCubit.getCubit(context).getCurrentLocation();
          HomeCubit.getCubit(context).getUserNotificationToken();
          HomeCubit.getCubit(context).getNotificationDB();
          HomeCubit.getCubit(context).getAllDepositMachine();
          HomeCubit.getCubit(context).getUserOrders();
          HomeCubit.getCubit(context).getAllCompanyOffers();
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.getCubit(context);
        final List<Widget> imageSliders = cubit.allOffers
            .map((item) => Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(item.image!,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width)),
                ))
            .toList();
        var now = DateTime.now();
        var formatterTime = DateFormat('kk:mm a');
        String actualTime = formatterTime.format(now);
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.backgroundColor,
            appBar: AppBar(
              titleSpacing: 3,
              leading: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.person_outlined,
                  size: 32,
                ),
              ),
              title: Text(
                'Good ${actualTime.contains('AM') ? 'morning' : 'evening'}, ${cubit.userModel != null ? cubit.userModel!.name! : ''}',
                style: Styles.textStyle20.copyWith(
                    color: AppColor.blackColor, fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      HomeCubit.getCubit(context).getNotificationDB();
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const NotificationView());
                    },
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.notifications_none_outlined,
                          size: 32,
                        ),
                        if(cubit.isNotificationOpened==false)
                        Container(
                          height: 15,
                          width: 15,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              color: AppColor.redColor, shape: BoxShape.circle),
                          child: Center(
                              child: Text(
                            '${cubit.notificationCounter}',
                            style: Styles.textStyle12
                                .copyWith(color: AppColor.wihteColor,height:0),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: cubit.userModel != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        cubit.allOffers.isNotEmpty
                            ? CarouselSlider(
                                items: imageSliders,
                                carouselController: _controller,
                                options: CarouselOptions(
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    aspectRatio: 2,
                                    onPageChanged: (index, reason) {
                                      cubit.changeCurrentOffer(index);
                                    }),
                              )
                            : const Center(
                                child: Text(
                                  'There is no offers yet!',
                                  style: Styles.textStyle18,
                                ),
                              ),
                        cubit.allOffers.isNotEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: cubit.allOffers
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () =>
                                        _controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(
                                                      cubit.current == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                    ),
                                  );
                                }).toList(),
                              )
                            : const SizedBox(
                                height: 20,
                              ),
                        Container(
                          height: MediaQuery.of(context).size.height * .7,
                          decoration: BoxDecoration(
                            color: AppColor.wihteColor,
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(24),
                                topEnd: Radius.circular(24)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                    onTap: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: ViewCardInfo(
                                            userModel: cubit.userModel!,
                                          ));
                                    },
                                    child: CardInformationWidget(
                                      userModel: cubit.userModel!,
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BasicFunctionsWidget(
                                      title: 'Save account',
                                      asset: AssetsData.saveAccountIcon,
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: const SaveAccountView());
                                      },
                                    ),
                                    BasicFunctionsWidget(
                                      title: 'Send gift',
                                      asset: AssetsData.sendGiftIcon,
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: const SendGiftsView());
                                      },
                                    ),
                                    BasicFunctionsWidget(
                                      title: 'Transfer',
                                      asset: AssetsData.transferIcon,
                                      onTap: () {
                                        if (cubit.allUsers.isNotEmpty) {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(context,
                                                  screen: TransferView());
                                        }
                                      },
                                    ),
                                    BasicFunctionsWidget(
                                      title: 'Deposit',
                                      asset: AssetsData.placeHolderIcon,
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: const DepositMachines());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
