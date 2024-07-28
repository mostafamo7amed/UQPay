import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:flutter/material.dart';

class AdminDepositMachineView extends StatelessWidget {
  const AdminDepositMachineView({super.key});

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
            'Add Deposit Machine',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: AppColor.backgroundColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select machine location:',
                        style: Styles.textStyle20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          autoFocus: false,
                          controller: TextEditingController(),
                          label: ' Latitude ',
                          validate: (value) {},
                          type: const TextInputType.numberWithOptions(
                              signed: true),
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          autoFocus: false,
                          controller: TextEditingController(),
                          label: ' Longitude ',
                          validate: (value) {},
                          type: const TextInputType.numberWithOptions(
                              signed: true),
                          context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Add location',
                      )
                    ],
                  ),
                ),
              );
            },
            child: Center(child: Text('tap here to select location'))),
      ),
    );
  }
}
