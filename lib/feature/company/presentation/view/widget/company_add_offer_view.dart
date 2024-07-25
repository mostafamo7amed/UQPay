import 'dart:io';

import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyAddOfferView extends StatefulWidget {
  const CompanyAddOfferView({super.key});

  @override
  State<CompanyAddOfferView> createState() => _CompanyAddOfferViewState();
}

class _CompanyAddOfferViewState extends State<CompanyAddOfferView> {
  File? offerImage;
  var picker = ImagePicker();

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
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
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
                          getOfferImage();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                              image: offerImage == null
                                  ? const NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl0a5ifQMQk61Z64YSK4hrS7M6lk3pS7VtNA&s')
                                  : FileImage(offerImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.grayColor, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                style: Styles.textStyle20
                                    .copyWith(color: AppColor.primaryColor),
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
  }

  Future<void> getOfferImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      offerImage = File(pickedFile.path);
    } else {
      print('no image selected');
    }
  }
}
