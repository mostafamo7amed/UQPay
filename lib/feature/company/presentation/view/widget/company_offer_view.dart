import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_add_offer_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_view_offers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/widgets/seperated_line.dart';

class CompanyOfferView extends StatelessWidget {
  const CompanyOfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if(state is DeleteOfferSuccessState){
          CompanyCubit.getCubit(context).getCompanyOffer();
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
                'Offers',
                style: Styles.textStyle24.copyWith(
                    color: AppColor.wihteColor, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: const CompanyAddOfferView());
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    shape: BoxShape.rectangle,
                    color: AppColor.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColor.wihteColor,
                        size: 28,
                      ),
                      Text(
                        'Add',
                        style: Styles.textStyle20
                            .copyWith(color: AppColor.wihteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: cubit.allOffers.isNotEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColor.backgroundColor,
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(24),
                                topEnd: Radius.circular(24)),
                          ),
                          child: ListView.builder(
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                color: AppColor.wihteColor,
                              ),
                              child: SizedBox(
                                height: 230,
                                child: Stack(
                                  clipBehavior: Clip.hardEdge,
                                  alignment: Alignment.center,
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              cubit.allOffers[index].image!),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: AppColor.wihteColor
                                                .withOpacity(0.7)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            CustomButton(
                                              onPressed: () {
                                                PersistentNavBarNavigator
                                                    .pushNewScreen(
                                                  context,
                                                  screen: CompanyViewOffersView(
                                                    offerModel:
                                                        cubit.allOffers[index],
                                                  ),
                                                );
                                              },
                                              height: 50,
                                              text: 'View',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                            ),
                                            CustomButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Center(
                                                              child: Text(
                                                                "Are you sure you want \ndelete offer ?!",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: Styles
                                                                    .textStyle20,
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
                                                              child:
                                                                  CustomButton(
                                                                onPressed: () {
                                                                  cubit.deleteOffer(cubit
                                                                      .allOffers[
                                                                          index]
                                                                      .id!);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4,
                                                                color: AppColor
                                                                    .redColor,
                                                                text: 'delete',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              text: 'Delete',
                                              height: 50,
                                              color: AppColor.redColor,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            itemCount: cubit.allOffers.length,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(24),
                          topEnd: Radius.circular(24)),
                    ),
                    child: const Center(
                      child: Text(
                        'There is no offers',
                        style: Styles.textStyle18,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
