import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/basic_functions_widget.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_cashback_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_notification_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_offer_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_orders_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_product_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyHomeScreen extends StatelessWidget {
  CompanyHomeScreen({super.key});

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CompanyCubit, CompanyState>(
  listener: (context, state) {
    if(state is GetCompanySuccessState){
      CompanyCubit.getCubit(context).getCompanyNotificationToken();
      CompanyCubit.getCubit(context).getCompanyOffer();
      CompanyCubit.getCubit(context).getCompanyProducts();
      CompanyCubit.getCubit(context).getCompanyNotifications();
      CompanyCubit.getCubit(context).getCompanyOrders();

    }
  },
  builder: (context, state) {
    var cubit = CompanyCubit.getCubit(context);
    final List<Widget> imageSliders = cubit.allOffers
        .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(item.image!,
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
            cubit.companyModel!=null? cubit.companyModel!.name!: '',
            style: Styles.textStyle20.copyWith(
                color: AppColor.blackColor, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  CompanyCubit.getCubit(context).getCompanyNotifications();
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
        body: cubit.companyModel!=null? Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            cubit.allOffers.isNotEmpty?
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  onPageChanged: (index, reason) {
                    cubit.changeCurrentOffer(index);
                  }),
            ):const Center(child: Text('There is no offers yet!',style: Styles.textStyle18,),),
            cubit.allOffers.isNotEmpty?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cubit.allOffers.asMap().entries.map((entry) {
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
                            .withOpacity(cubit.current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ):const SizedBox(height: 20,),
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
                                              .pushNewScreen(
                                                context,
                                                  screen:
                                                      const CompanyOfferView());
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: BasicFunctionsWidget(
                                        title: 'Manage cashback',
                                        asset: AssetsData.cashBack,
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen: CompanyUpdateCashbackView());
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
                                        title: 'Manage orders',
                                        icon: Icons.shopping_cart_checkout,
                                        onTap: () {
                                          CompanyCubit.getCubit(context).getCompanyOrders();
                                          PersistentNavBarNavigator
                                              .pushNewScreen(context,
                                                  screen:
                                                      const CompanyOrdersView());
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: BasicFunctionsWidget(
                                        title: 'Manage products',
                                        icon: Icons.shopify,
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen:
                                                  const CompanyProductScreen());
                                        },
                                      ),
                                    ),
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
        ): const Center(child: CircularProgressIndicator(),),
      ),
    );
  },
);
  }
}
