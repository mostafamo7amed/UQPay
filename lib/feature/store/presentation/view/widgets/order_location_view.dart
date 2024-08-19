import 'dart:async';

import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/pickup_oder_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/functions/get_random_number.dart';
import '../../../../../core/functions/toast.dart';
import '../../../../company/data/company_model.dart';

class OrderLocationView extends StatelessWidget {
  OrderLocationView({
    super.key, required this.productModel, required this.companyModel,
  });
  final ProductModel productModel;
  final CompanyModel companyModel;
  final Completer<GoogleMapController> mapController =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    CameraPosition companyLocation = CameraPosition(
      target: LatLng(companyModel.latitude!,companyModel.longitude!),
      zoom: 14.4746,
    );
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: AppColor.backgroundColor,
          titleSpacing: 3,
          leading: InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.blackColor,
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                child: companyLocation!=null? GoogleMap(
                  markers: {
                    Marker(
                      markerId: MarkerId(companyModel.address!),
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                      position: LatLng(companyModel.latitude!,companyModel.longitude!),
                      infoWindow: InfoWindow(title: companyModel.address!),
                    ),
                  },
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition:companyLocation,
                  onMapCreated: (GoogleMapController controller) {
                    mapController.complete(controller);
                  },
                ): const Center(child: CircularProgressIndicator(),),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.6,
              decoration: BoxDecoration(
                color: AppColor.lightgrayColor,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => StoreLocationWidget(companyModel: companyModel, productModel: productModel,),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 2,
                      ),
                  itemCount: 1),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}

class StoreLocationWidget extends StatelessWidget {
  const StoreLocationWidget({
    super.key, required this.companyModel, required this.productModel,

  });
  final CompanyModel companyModel;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit =HomeCubit.getCubit(context);
    var distance =cubit.calculateDistance(companyModel.latitude, companyModel.longitude);
    return InkWell(
      onTap: () {
        int orderNumber = getRandomNumber6();
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Text(
                        "Order detail",
                        style: Styles.textStyle20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SeparatedLine(),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'Order #$orderNumber',
                        style: Styles.textStyle18,
                      ),
                    ),
                    const Text(
                      'Amount',
                      style: Styles.textStyle18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.grayColor)),
                      child:  Padding(
                        padding:const EdgeInsets.all(5.0),
                        child: Text(
                          '${productModel.amount} SAR',
                          style: Styles.textStyle18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${productModel.productType} info:',
                      style: Styles.textStyle18,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 4,
                        ),
                        Text('${companyModel.address}')
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.social_distance_outlined),
                        const SizedBox(
                          width: 4,
                        ),
                        Text('${distance.roundToDouble()} KM')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                        ),
                        CustomButton(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3,
                          onPressed: () {
                            if(cubit.isPaymentStop==false && cubit.isCardStop==false) {
                              cubit.makeOrder(
                                  orderNumber.toString(),
                                  productModel.productType!,
                                  companyModel.uid!,
                                  companyModel,
                                  productModel.amount!,
                                  productModel);
                              if (productModel.productType == 'Service') {
                                Navigator.pop(context);
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: OderDetailsView(
                                      orderNumber: orderNumber,
                                      companyModel: companyModel,
                                      productModel: productModel,
                                    ));
                              } else {
                                Navigator.pop(context);
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: PickupOderDetailsView(
                                      orderNumber: orderNumber,
                                      companyModel: companyModel,
                                      productModel: productModel,
                                    ));
                              }
                            }else{
                              toast(message: 'Online Payment is Disabled temporarily\n check your card settings and try again', data: ToastStates.warning);
                            }
                          },
                          text: 'Confirm',
                          isLoading: state is MakeOrderLoadingState,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      companyModel.name!,
                      style: Styles.regularTextStyle16,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: AppColor.greenColor.withOpacity(.3),
                      ),
                      child: Text('${distance.roundToDouble()} KM'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: AppColor.greenColor.withOpacity(.3),
                      ),
                      child: const Text('Open'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                 Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(companyModel.address!)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                 Row(
                  children: [
                    const Icon(Icons.phone),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(companyModel.phone!)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
