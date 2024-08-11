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

class AdminAddCategory extends StatelessWidget {
  AdminAddCategory({super.key});
  final TextEditingController nameController =TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if(state is AddCategorySuccessState){
          AdminCubit.getCubit(context).getAllCategory();
          toast(message: 'Category added Successfully', data: ToastStates.success);
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
                'Add Category',
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
                                'Enter Category Information',
                                style: Styles.textStyle24
                                    .copyWith(color: AppColor.yellowColor),
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.getCategoryImage();
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColor.grayColor, width: 1),
                                    image: DecorationImage(
                                      image: cubit.categoryImage == null
                                          ? const NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl0a5ifQMQk61Z64YSK4hrS7M6lk3pS7VtNA&s')
                                          : FileImage(cubit.categoryImage!),
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
                                  controller: nameController,
                                  label: ' Category Name ',
                                  validate: (value) {
                                    if(nameController.text.isEmpty){
                                      return 'Category name can\'t be empty';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.name,
                                  context: context),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate()) {
                                    if (cubit.categoryImage != null) {
                                      cubit.addCategory(nameController.text, cubit.categoryImageUri);
                                    } else {
                                      toast(message: 'Select category image',
                                          data: ToastStates.error);
                                    }
                                  }
                                },
                                text: 'Add',
                                isLoading: state is AddCategoryLoadingState,
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
