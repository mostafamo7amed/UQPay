import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/transfer/fast_transfer_fav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/transfer/confirm_transfer.dart';

class TransferView extends StatelessWidget {
  TransferView({super.key});
  final TextEditingController amountController = TextEditingController();
  late double amount;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeUpdateMoneySuccessState) {
          if(HomeCubit.getCubit(context).selectedTransferUser != null){

            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: ConfirmTransferView(
                amount: amount,
                receiverUser: HomeCubit.getCubit(context).selectedTransferUser!,
              ),
            );
          }else{
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: ConfirmTransferView(
                amount: amount,
                receiverUser: HomeCubit.getCubit(context).selectedFavTransferUser!,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.getCubit(context);
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
                'Transfer',
                style:
                    Styles.boldTextStyle16.copyWith(color: AppColor.wihteColor),
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
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Faster Transfer',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: const FastTransferFavView());
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                  color: AppColor.lightgrayColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: AppColor.yellowColor,
                                      size: 45,
                                    ),
                                    Text(
                                      'Add',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.regularTextStyle16
                                          .copyWith(color: AppColor.blackColor),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            FastTransferHorizentalList(
                              users: cubit.allFastTransferUsers,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'To',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 75,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            color: AppColor.lightgrayColor,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetsData.personRounded,
                                height: 56,
                              ),
                              Expanded(
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: Alignment.centerLeft,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: 35,
                                    ),
                                    hint: const Text(
                                      'Select Account',
                                      textAlign: TextAlign.start,
                                      style: Styles.textStyle18,
                                    ),
                                    value: cubit.selectedTransferUser,
                                    items: cubit.allUsers.map((user) {
                                      return DropdownMenuItem(
                                          value: user,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('${user.name}'),
                                              Text('${user.cardNumber}'),
                                            ],
                                          ));
                                    }).toList(),
                                    onChanged: (value) {
                                      cubit.changeSelectedTransferUser(value!);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Amount',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            color: AppColor.lightgrayColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                suffixText: 'SAR',
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: CustomButton(
                            onPressed: () {
                              if(cubit.isCardStop==false) {
                                if (amountController.text.isNotEmpty) {
                                  amount = double.parse(amountController.text);
                                  if (amount < cubit.userModel!.cardAmount! &&
                                      amount > 0) {
                                    if (cubit.selectedTransferUser != null) {
                                      cubit.transferMoney(
                                          cubit.selectedTransferUser!, amount);
                                    } else if (cubit.selectedFavTransferUser !=
                                        null) {
                                      cubit.transferMoney(
                                          cubit.selectedFavTransferUser!,
                                          amount);
                                    } else {
                                      toast(
                                          message: 'Please select account',
                                          data: ToastStates.error);
                                    }
                                  } else {
                                    toast(
                                        message: 'Please enter valid amount',
                                        data: ToastStates.error);
                                  }
                                } else {
                                  toast(
                                      message: 'Please enter amount',
                                      data: ToastStates.error);
                                }
                              }else{
                                toast(message: 'Card is Paused temporarily\n check your card settings and try again', data: ToastStates.warning);
                              }
                            },
                            text: 'Confirm',
                            isLoading: state is HomeTransferLoadingState,
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FastTransferHorizentalList extends StatelessWidget {
  FastTransferHorizentalList({
    super.key,
    required this.users,
  });

  List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              HomeCubit.getCubit(context)
                  .changeSelectedFavTransferUser(users[index]);
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: HomeCubit.getCubit(context).selectedFavTransferUser ==
                          users[index]
                      ? AppColor.yellowColor
                      : AppColor.lightgrayColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                color: AppColor.lightgrayColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsData.personRounded,
                    height: 56,
                  ),
                  Text(
                    '${users[index].name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.regularTextStyle16
                        .copyWith(color: AppColor.blackColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 5,
          ),
          itemCount: users.length,
        ),
      ),
    );
  }
}
