import 'dart:async';

import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/admin/presentation/manager/admin_cubit.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AdminDepositMachineScreen extends StatefulWidget {
  const AdminDepositMachineScreen({super.key});
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<AdminDepositMachineScreen> createState() => _AdminDepositMachineScreenState();
}

class _AdminDepositMachineScreenState extends State<AdminDepositMachineScreen> {

  final Completer<GoogleMapController> mapController =
  Completer<GoogleMapController>();

  final locationController = Location();
  final markerNameController =TextEditingController();
  final markerLongController =TextEditingController();
  final markerLatController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  LatLng? currentPosition;

  List<Marker> marker =[];

  Future getLocationUpdate() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        if (this.mounted) {
          setState(() {
            currentPosition =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
            cameraToPosition(currentPosition!);
          });
        }
      }
    });
  }

  Future cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition newCameraPos = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPos),
    );
  }
  @override
  void initState() {
    getLocationUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
  listener: (context, state) {
    if(state is AddMachineSuccessState){
      toast(message: 'Position Added Successfully', data: ToastStates.success);
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    var cubit = AdminCubit.getCubit(context);
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
        bottomSheet: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
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
                      controller: markerNameController,
                      label: ' Name ',
                      validate: (value) {
                        if(markerNameController.text.isEmpty){
                          return 'Enter machine name';
                        }
                        return null;
                      },
                      type: TextInputType.name,
                      context: context),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                      autoFocus: false,
                      controller: markerLatController,
                      label: ' Latitude ',
                      validate: (value) {},
                      type: const TextInputType.numberWithOptions(signed: true),
                      context: context),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                      autoFocus: false,
                      controller: markerLongController,
                      label: ' Longitude ',
                      validate: (value) {},
                      type: const TextInputType.numberWithOptions(signed: true),
                      context: context),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onPressed: () {
                      if(markerNameController.text.isNotEmpty && markerLatController.text.isNotEmpty){
                        cubit.addDepositMachine(markerNameController.text, markerLongController.text, markerLatController.text);
                      }else{
                        toast(message: 'Select position', data: ToastStates.error);
                      }
                    },
                    isLoading: state is AddMachineLoadingState,
                    text: 'Add location',
                  )
                ],
              ),
            ),
          ),
        ),
        body:currentPosition!=null? GoogleMap(
          onTap: (argument) {
            if(formKey.currentState!.validate()){
             Marker newMachine = Marker(
                markerId: MarkerId(markerNameController.text.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                position: LatLng(argument.latitude,argument.longitude),
                infoWindow: InfoWindow(title: markerNameController.text.toString()),
              );
              markerLongController.text = argument.longitude.toString();
              markerLatController.text =argument.latitude.toString();
              marker.add(newMachine);
            }
          },
          markers: marker.map((e)=>e).toSet(),
      mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition:AdminDepositMachineScreen._kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
      ):  const Center(child: CircularProgressIndicator()),
      ),
    );
  },
);
  }
}
