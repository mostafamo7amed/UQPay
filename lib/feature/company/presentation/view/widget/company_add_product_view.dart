import 'dart:io';

import 'package:UQPay/core/functions/pickImage_fun.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyAddProductView extends StatefulWidget {
  const CompanyAddProductView({super.key});

  @override
  State<CompanyAddProductView> createState() => _CompanyAddProductViewState();
}

class _CompanyAddProductViewState extends State<CompanyAddProductView> {
  File? productImage;

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
            'Add Product',
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
                          'Enter Product Information',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.yellowColor),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                              image: productImage == null
                                  ? const NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl0a5ifQMQk61Z64YSK4hrS7M6lk3pS7VtNA&s')
                                  : FileImage(productImage!),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: TextEditingController(),
                            label: ' Product Name ',
                            validate: (value) {},
                            type: TextInputType.name,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: TextEditingController(),
                            label: ' Product Amount ',
                            validate: (value) {},
                            suffixWidget: Text(
                              'SAR',
                              style: Styles.regularTextStyle16
                                  .copyWith(color: AppColor.grayColor),
                            ),
                            type: TextInputType.number,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                              showSelectedItems: true, fit: FlexFit.loose),
                          items: const [
                            "Service",
                            "Pikup",
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
                              label: const Text('Product Type',
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
                        SizedBox(
                          height: 120,
                          child: TextFormField(
                            maxLines: null, // Set this
                            expands: true,
                            textAlignVertical: TextAlignVertical.top,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              label: const Text(' Description ',
                                  style: Styles.textStyle18),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                            validator: (value) {},
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            pikImageFile(productImage);
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.yellowColor, width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: AppColor.blackColor,
                                    size: 35,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Upload',
                                    style: Styles.textStyle20
                                        .copyWith(color: AppColor.blackColor),
                                  )
                                ],
                              ),
                            ),
                          ),
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
