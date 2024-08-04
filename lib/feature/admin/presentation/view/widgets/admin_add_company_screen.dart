import 'dart:io';
import 'package:UQPay/core/functions/pickImage_fun.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AdminAddCompanyScreen extends StatelessWidget {
  AdminAddCompanyScreen({super.key});
  File? campanyImage;

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
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          title: Text(
            'Add Company',
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
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Company Information',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.yellowColor),
                        ),
                        InkWell(
                          onTap: () {
                            pikImageFile(campanyImage);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColor.grayColor, width: 1),
                              image: DecorationImage(
                                image: campanyImage == null
                                    ? const NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl0a5ifQMQk61Z64YSK4hrS7M6lk3pS7VtNA&s')
                                    : FileImage(campanyImage!),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: TextEditingController(),
                            label: ' Company Name ',
                            validate: (value) {},
                            type: TextInputType.name,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: TextEditingController(),
                            label: ' Company Password ',
                            validate: (value) {},
                            type: TextInputType.number,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: TextEditingController(),
                            label: ' Company Phone ',
                            validate: (value) {},
                            type: TextInputType.number,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                              showSelectedItems: true, fit: FlexFit.loose),
                          items: const [
                            "Gym",
                            "Clinic",
                            "Training",
                            "Cofe",
                            "Restourant",
                            "Gold Shop",
                          ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            baseStyle: Styles.regularTextStyle16
                                .copyWith(color: AppColor.blackColor),
                            dropdownSearchDecoration: InputDecoration(
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
                              label: const Text('Company Category',
                                  style: Styles.textStyle18),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.yellowColor, width: 2.0),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                              ),
                              labelStyle: Styles.regularTextStyle16
                                  .copyWith(color: AppColor.blackColor),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () {},
                          text: 'Add',
                          width: (MediaQuery.of(context).size.width) / 4,
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
