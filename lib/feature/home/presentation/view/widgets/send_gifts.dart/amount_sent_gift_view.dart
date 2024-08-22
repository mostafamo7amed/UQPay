import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/massege_send_gift_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';

class AmountSentGiftView extends StatefulWidget {
  const AmountSentGiftView({super.key,required this.userModel});
  final UserModel userModel;

  @override
  State<AmountSentGiftView> createState() => _AmountSentGiftViewState();
}

class _AmountSentGiftViewState extends State<AmountSentGiftView> {
  var amountController = TextEditingController();
  bool anotherAmount = false;
  late double amount;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
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
            'Send Gift',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'cancel',
                  style: Styles.regularTextStyle16
                      .copyWith(color: AppColor.wihteColor),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Send gift',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.yellowColor),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              AssetsData.backgroundVisa,
                              height: 240,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: SizedBox(
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          'To : ${widget.userModel.name}',
                                          style: Styles.regularTextStyle16
                                              .copyWith(
                                                  color: AppColor.wihteColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${cubit.giftAmount} SAR',
                                      style: Styles.textStyle24
                                          .copyWith(color: AppColor.wihteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AmountContainer(
                              onTap: (){
                                if (100.0 < cubit.userModel!.cardAmount!){
                                  cubit.changeGiftAmount(100.0);
                                  PersistentNavBarNavigator.pushNewScreen(context,
                                      screen: MessageSendGiftView());
                                }else{
                                  toast(message: 'You don\'t have this amount', data: ToastStates.error);
                                }
                              },
                              amount: 100.00,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AmountContainer(
                              onTap: (){
                                if (200.0 < cubit.userModel!.cardAmount!){
                                  cubit.changeGiftAmount(200.0);
                                  PersistentNavBarNavigator.pushNewScreen(context,
                                      screen: MessageSendGiftView());
                                }else{
                                  toast(message: 'You don\'t have this amount', data: ToastStates.error);
                                }
                              },
                              amount: 200.00,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            AmountContainer(
                              onTap: (){
                                if (500.0 < cubit.userModel!.cardAmount!){
                                  cubit.changeGiftAmount(500.0);
                                  PersistentNavBarNavigator.pushNewScreen(context,
                                      screen: MessageSendGiftView());
                                }else{
                                  toast(message: 'You don\'t have this amount', data: ToastStates.error);
                                }
                              },
                              amount: 500.00,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AmountContainer(
                              onTap: (){
                                if (1000.0 < cubit.userModel!.cardAmount!){
                                  cubit.changeGiftAmount(1000.0);
                                  PersistentNavBarNavigator.pushNewScreen(context,
                                      screen: MessageSendGiftView());
                                }else{
                                  toast(message: 'You don\'t have this amount', data: ToastStates.error);
                                }

                              },
                              amount: 1000.00,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    anotherAmount = true;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: AppColor.lightgrayColor,
                                    borderRadius:
                                        const BorderRadiusDirectional.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    'another',
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle18.copyWith(
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                              ),
                            ),
                          ],
                        ),
                        if (anotherAmount)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Gift Amount',
                                style: Styles.textStyle24
                                    .copyWith(color: AppColor.yellowColor),
                              ),
                              defaultFormField(
                                  autoFocus: false,
                                  controller: amountController,
                                  validate: (e) {


                                  },
                                  type: TextInputType.number,
                                  suffixWidget: Text(
                                    'SAR',
                                    style: Styles.regularTextStyle16
                                        .copyWith(color: AppColor.grayColor),
                                  ),
                                  context: context),
                            ],
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onPressed: () {
                                if(cubit.isCardStop==false) {
                                  if (amountController.text.isNotEmpty) {
                                    amount =
                                        double.parse(amountController.text);
                                    if (amount < cubit.userModel!.cardAmount! &&
                                        amount > 0) {
                                      cubit.changeGiftAmount(amount);
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: MessageSendGiftView());
                                    } else {
                                      toast(
                                          message: 'You don\'t have this amount',
                                          data: ToastStates.error);
                                    }
                                  } else {
                                    toast(
                                        message: 'Please enter another amount',
                                        data: ToastStates.error);
                                  }
                                }else{
                                  toast(message: 'Card is Paused temporarily\n check your card settings and try again', data: ToastStates.warning);
                                }
                              },
                              text: 'Next',
                              width: (MediaQuery.of(context).size.width) / 3.5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}

class AmountContainer extends StatelessWidget {
  AmountContainer({
    super.key,
    required this.amount,
    required this.onTap,
  });
  void Function()? onTap;
  double amount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColor.lightgrayColor,
            borderRadius:
                const BorderRadiusDirectional.all(
              Radius.circular(16),
            ),
          ),
          child: Text(
            '$amount SAR',
            textAlign: TextAlign.center,
            style: Styles.textStyle18.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
