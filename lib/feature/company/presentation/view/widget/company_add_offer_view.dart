import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyAddOfferView extends StatelessWidget {
  const CompanyAddOfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if(state is AddOfferSuccessState){
          toast(message: 'Offer uploaded successfully', data: ToastStates.success);
          CompanyCubit.getCubit(context).getCompanyOffer();
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
                ' Add Offers',
                style: Styles.textStyle24.copyWith(
                    color: AppColor.wihteColor, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, right: 10, left: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(24),
                          topEnd: Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tap to select image',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.getOfferImage();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: cubit.offerImage == null
                                      ? const NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl0a5ifQMQk61Z64YSK4hrS7M6lk3pS7VtNA&s')
                                      : FileImage(cubit.offerImage!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (cubit.offerImage != null &&
                                cubit.offerImageUri != '') {
                              cubit.addOffer(cubit.offerImageUri);
                            }else{
                              toast(message: 'Tap to Select an image', data: ToastStates.error);
                            }
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.grayColor, width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: state is AddOfferLoadingState
                                  ? const Center(child:  CircularProgressIndicator())
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_photo_alternate_outlined,
                                          color: AppColor.primaryColor,
                                          size: 35,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Upload',
                                          style: Styles.textStyle20.copyWith(
                                              color: AppColor.primaryColor),
                                        )
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
