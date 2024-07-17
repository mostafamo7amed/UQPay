import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/transfer/confirm_transfer.dart';

class TransferView extends StatelessWidget {
  TransferView({super.key});

  List<String> accounts = ['wala', 'noha', 'mariem', 'ahmed'];
  String? selectedName;

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
            'Transfer',
            style: Styles.boldTextStyle16.copyWith(color: AppColor.wihteColor),
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
                    const FastTransferHorizentalList(),
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
                          DropdownButton(
                              alignment: Alignment.center,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 35,
                              ),
                              hint: const Text(
                                'Select Account',
                                style: Styles.textStyle18,
                              ),
                              value: selectedName,
                              items: accounts.map((name) {
                                return DropdownMenuItem(
                                    value: name, child: Text(name));
                              }).toList(),
                              onChanged: (value) {
                                selectedName = value;
                              }),
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
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: const ConfirmTransferView());
                        },
                        text: 'Confirm',
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
  }
}

class FastTransferHorizentalList extends StatelessWidget {
  const FastTransferHorizentalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 100,
          decoration: BoxDecoration(
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
                'Wala',
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
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: 10,
      ),
    );
  }
}
