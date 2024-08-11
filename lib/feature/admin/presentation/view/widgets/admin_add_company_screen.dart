import 'dart:io';
import 'package:UQPay/core/cache_helper/cache_helper.dart';
import 'package:UQPay/core/functions/pickImage_fun.dart';
import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/utils/common.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/admin/presentation/manager/admin_cubit.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAddCompanyScreen extends StatelessWidget {
  AdminAddCompanyScreen({super.key});
  final TextEditingController conNameController =TextEditingController();
  final TextEditingController conEmailController =TextEditingController();
  final TextEditingController conPasswordController =TextEditingController();
  final TextEditingController conPhoneController =TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
  listener: (context, state) {
    if(state is AddCompanySuccessState){
      String email = CacheHelper.getData(key: 'email');
      String password = CacheHelper.getData(key: 'password');
      AdminCubit.getCubit(context).adminLogin(email, password);
      AdminCubit.getCubit(context).getAllCompany();

    }
    if(state is ReLoginSuccessState){
      uid = state.uid;
      print(uid);
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    var cubit = AdminCubit.getCubit(context);
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
        body: Form(
          key: formKey,
          child: Column(
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
                              cubit.getCompanyImage();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColor.grayColor, width: 1),
                                image: DecorationImage(
                                  image: cubit.companyImage == null
                                      ? const NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl0a5ifQMQk61Z64YSK4hrS7M6lk3pS7VtNA&s')
                                      : FileImage(cubit.companyImage!),
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
                              controller: conNameController,
                              label: ' Company Name ',
                              validate: (value) {
                                if(conNameController.text.isEmpty){
                                  return 'Company name can\'t be empty';
                                }
                                return null;
                              },
                              type: TextInputType.name,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              autoFocus: false,
                              controller: conEmailController,
                              label: ' Company email ',
                              validate: (value) {
                                if (value.isEmpty||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                                  return 'Please enter organization email address ';
                                }else if(!value!.contains('.org')){
                                  return 'Organization email address should contain .org';
                                }
                                return null;
                              },
                              type: TextInputType.name,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              autoFocus: false,
                              controller: conPasswordController,
                              label: ' Company Password ',
                              isObscureText: cubit.obscure,
                              suffixWidget: InkWell(
                                onTap: () {
                                  cubit.changeObscure();
                                },
                                child: cubit.eyeIcon, //cubit.eyeIcon,
                              ),
                              validate: (value) {
                                if(conPasswordController.text.isEmpty){
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              autoFocus: false,
                              controller: conPhoneController,
                              label: ' Company Phone ',
                              validate: (value) {
                                if(conPhoneController.text.isEmpty){
                                  return 'Please enter phone number';
                                }else if(!RegExp(r'^(?:[+966])?[0-9]{12}$').hasMatch(value)){
                                  return 'Please enter valid phone number starts with +';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),
                          DropdownSearch<String>(
                            selectedItem: cubit.companyCategory,
                            popupProps: const PopupProps.menu(
                                showSelectedItems: true, fit: FlexFit.loose),
                            items: cubit.allCategory
                                .map(
                                  (e) => e.name!,
                            )
                                .toList(),
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
                            onChanged: (value) {
                              if(value!=null){
                                cubit.selectCategory(value);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()) {
                                if (cubit.companyImage != null) {
                                  if (cubit.companyCategory != null) {
                                    cubit.registerCompany(conNameController.text,
                                        conPhoneController.text,
                                        cubit.companyCategory!,
                                        cubit.companyImageUri,
                                        conEmailController.text,
                                        conPasswordController.text);
                                  } else {
                                    toast(message: 'Select company category',
                                        data: ToastStates.error);
                                  }
                                } else {
                                  toast(message: 'Select company image',
                                      data: ToastStates.error);
                                }
                              }
                            },
                            text: 'Add',
                            isLoading: state is RegisterCompanyLoadingState,
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
      ),
    );
  },
);
  }
}
