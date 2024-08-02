import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AdminRechargeCardView extends StatefulWidget {
  const AdminRechargeCardView({super.key});

  @override
  State<AdminRechargeCardView> createState() => _AdminRechargeCardViewState();
}

class _AdminRechargeCardViewState extends State<AdminRechargeCardView> {
  int accountSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 3,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          title: Text(
            ' Recharge cards',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Account',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColor.lightgrayColor,
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AssetsData.personRounded,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: AppColor.grayColor,
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'User ID',
                                        hintStyle: Styles.textStyle18.copyWith(
                                            color: AppColor.grayColor,
                                            fontWeight: FontWeight.normal),
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  CustomButton(
                                    onPressed: () {},
                                    text: 'Search',
                                    color: AppColor.primaryColor,
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width / 4.5,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    accountSelected = 0;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: accountSelected == 0
                                            ? AppColor.yellowColor
                                            : Colors.transparent,
                                        border: Border.all(
                                            width: 2,
                                            color: AppColor.yellowColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Employee',
                                      style: Styles.textStyle18.copyWith(
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    accountSelected = 1;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: accountSelected == 1
                                            ? AppColor.yellowColor
                                            : Colors.transparent,
                                        border: Border.all(
                                            width: 2,
                                            color: AppColor.yellowColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Student',
                                      style: Styles.textStyle18.copyWith(
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'User Info',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: AppColor.lightgrayColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID : 53442514',
                                  style: Styles.textStyle18
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'User Name : ahmed yasser',
                                  style: Styles.textStyle18
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Amount',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
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
                            onPressed: () {},
                            text: 'Confirm',
                            width: (MediaQuery.of(context).size.width) / 4,
                          ),
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
