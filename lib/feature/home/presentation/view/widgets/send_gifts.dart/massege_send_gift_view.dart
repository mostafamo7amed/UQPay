import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/send_gift_review_screen.dart';

class MessageSendGiftView extends StatelessWidget {
  MessageSendGiftView({super.key});
  final TextEditingController messageController =TextEditingController();
  final TextEditingController nameController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  

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
        body: Form(
          key: formKey,
          child: Column(
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
                                            'To : ${cubit.selectedTransferUser!.name}',
                                            style: Styles.regularTextStyle16
                                                .copyWith(
                                                    color: AppColor.wihteColor),
                                          ),
                                          const SizedBox(
                                            width: 10,
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
                          Text(
                            'Gift Message',
                            style: Styles.textStyle24
                                .copyWith(color: AppColor.yellowColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 120,
                            child: TextFormField(
                              onChanged: (value) => cubit.changeGiftMessage(value),
                              maxLines: null, // Set this
                              expands: true,
                              controller: messageController,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.yellowColor, width: 2.0),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.yellowColor, width: 2.0),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16)),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.yellowColor, width: 2.0),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16)),
                                ),
                                labelStyle: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              validator: (value) {
                                if(messageController.text.isEmpty){
                                  return 'Message can\'t be empty';
                                }
                                return '';
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              autoFocus: false,
                              onChange: (value)=> cubit.changeGiftName(value),
                              controller: nameController,
                              label: ' Name ',
                              validate: (e) {},
                              type: TextInputType.name,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onPressed: () {
                                  if(messageController.text.isNotEmpty){
                                    cubit.changeGiftMessage(messageController.text);
                                    if(nameController.text.isNotEmpty){
                                      cubit.changeGiftName(nameController.text);
                                    }
                                    PersistentNavBarNavigator.pushNewScreen(context,
                                        screen: const SendGiftReviewScreen());
                                  }else{
                                    toast(message: 'Please enter gift message', data: ToastStates.error);
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
      ),
    );
  },
);
  }
}
