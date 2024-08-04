import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/massege_send_gift_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/send_gift_review_screen.dart';

class AmountSentGiftView extends StatefulWidget {
  const AmountSentGiftView({super.key});

  @override
  State<AmountSentGiftView> createState() => _AmountSentGiftViewState();
}

class _AmountSentGiftViewState extends State<AmountSentGiftView> {
  var amountControler = TextEditingController();
  bool anthorAmount = false;

  @override
  Widget build(BuildContext context) {
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
                                          'To : Rafal Mousa',
                                          style: Styles.regularTextStyle16
                                              .copyWith(
                                                  color: AppColor.wihteColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '0.00 SAR',
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
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: const MassegeSendGiftView());
                              },
                              amount: 100.00,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AmountContainer(
                              onTap: (){
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: const MassegeSendGiftView());
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
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: const MassegeSendGiftView());
                              },
                              amount: 500.00,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AmountContainer(
                              onTap: (){
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: const MassegeSendGiftView());
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
                                    anthorAmount = true;
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
                        if (anthorAmount)
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
                                  controller: amountControler,
                                  validate: (e) {},
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
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: const MassegeSendGiftView());
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
