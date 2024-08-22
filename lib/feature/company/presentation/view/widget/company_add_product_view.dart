import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyAddProductView extends StatelessWidget {
  CompanyAddProductView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController =TextEditingController();
  final TextEditingController descriptionController= TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
  listener: (context, state) {
    if(state is AddProductSuccessState){
      toast(message: 'Product Added successfully', data: ToastStates.success);
      CompanyCubit.getCubit(context).getCompanyProducts();
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    var cubit = CompanyCubit.getCubit(context);
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Enter Product Information',
                              style: Styles.textStyle24
                                  .copyWith(color: AppColor.yellowColor),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const SeparatedLine(),
                          const SizedBox(height: 5,),
                          Text(
                            'Tap to select image',
                            style: Styles.textStyle17
                                .copyWith(color: AppColor.grayColor),
                          ),
                          const SizedBox(height: 5,),
                          InkWell(
                            onTap: (){
                              cubit.getProductImage();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: cubit.productImage == null
                                      ? const NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl0a5ifQMQk61Z64YSK4hrS7M6lk3pS7VtNA&s')
                                      : FileImage(cubit.productImage!),
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
                              label: ' Product Name ',
                              validate: (value) {
                                if(nameController.text.isEmpty){
                                  return 'Please enter product name';
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
                              controller: amountController,
                              label: ' Product Amount ',
                              validate: (value) {
                                if(amountController.text.isEmpty){
                                  return 'Please enter product amount';
                                }
                                return null;
                              },
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
                              "Pickup",
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
                            onChanged: (value) {
                              if(value!=null){
                                cubit.selectProductType(value);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 120,
                            child: TextFormField(
                              controller: descriptionController,
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
                              validator: (value) {
                                if(descriptionController.text.isEmpty){
                                  return 'Please enter product description';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CustomButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  if(cubit.productType!=null){
                                    if(cubit.productImageUri!=''){
                                       cubit.addProduct(
                                           nameController.text,
                                           descriptionController.text,
                                           double.parse(amountController.text),
                                           cubit.productImageUri,
                                           cubit.productType!
                                       );
                                    }else{
                                      toast(message: 'Please select product image', data: ToastStates.error);
                                    }
                                  }else{
                                    toast(message: 'Please select product type', data: ToastStates.error);
                                  }
                                }
                              },
                              text: 'Add',
                              isLoading: state is AddProductLoadingState,
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
      ),
    );
  },
);
  }
}
