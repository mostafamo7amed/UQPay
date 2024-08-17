import 'dart:async';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../company/data/company_model.dart';

class OpenInMapView extends StatelessWidget {
  OpenInMapView({
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
          ],
        ),
      ),
    );
  }
}
