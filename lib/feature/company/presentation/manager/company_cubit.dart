import 'dart:io';

import 'package:UQPay/feature/company/data/offer_model.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/functions/get_random_number.dart';
import '../../../../core/utils/common.dart';
import '../../data/company_model.dart';
part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());

  static CompanyCubit getCubit(context) => BlocProvider.of(context);

  CompanyModel? companyModel;
  void getCompany(String uid) {
    emit(GetCompanyLoading());
    FirebaseFirestore.instance
        .collection('Company')
        .doc(uid)
        .get()
        .then((value) {
      companyModel = CompanyModel.fromMap(value.data()!);
      print(companyModel!.email);
      emit(GetCompanySuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetCompanyErrorState());
    });
  }

// use the returned token to send messages to users from your custom server
  String? token;
  getCompanyNotificationToken() async {
    token = await FirebaseMessaging.instance.getToken();
    print(token);
    updateCompanyNotificationToken(companyModel!, token!);
  }

  updateCompanyNotificationToken(CompanyModel user, String token) {
    CompanyModel companyModel = CompanyModel(
        user.email,
        user.name,
        user.password,
        user.id,
        user.image,
        token,
        user.type,
        user.uid,
        user.phone,
        user.category,
        user.supportType,
        user.cashback);
    FirebaseFirestore.instance
        .collection('Company')
        .doc(user.uid)
        .update(companyModel.toMap()!)
        .then((value) {
      emit(UpdateCompanyTokenSuccessState());
    }).catchError((e) {
      emit(UpdateCompanyTokenErrorState());
    });
  }

  var picker = ImagePicker();
  File? offerImage;
  Future<void> getCompanyImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      offerImage = File(pickedFile.path);
      emit(PikOfferImageSuccessState());
      uploadOfferImage();
    } else {
      print('no image selected');
      emit(PikOfferImageErrorState());
    }
  }

  String offerImageUri = '';
  uploadOfferImage() {
    FirebaseStorage.instance
        .ref()
        .child('offers/images/${Uri.file(offerImage!.path).pathSegments.last}')
        .putFile(offerImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        offerImageUri = value;
        emit(UploadOfferImageSuccessState());
      }).catchError((e) {
        emit(UploadOfferImageErrorState());
      });
    }).catchError((error) {
      emit(UploadOfferImageErrorState());
      print(error.toString());
    });
  }

  addOffer(String image) {
    emit(AddOfferLoadingState());
    int id = getRandomNumber();
    OfferModel offerModel = OfferModel(id, image);
    FirebaseFirestore.instance
        .collection('Offers')
        .doc(uid)
        .collection('Company Offer')
        .doc('$id')
        .set(offerModel.toMap()!)
        .then((value) {
      FirebaseFirestore.instance
          .collection('All Offers')
          .doc('$id')
          .set(offerModel.toMap()!)
          .then((value) {
        emit(AddOfferSuccessState());
      }).catchError((e) {
        emit(AddOfferErrorState());
      });
    }).catchError((e) {
      emit(AddOfferErrorState());
    });
  }

  List<OfferModel> allOffers = [];
  getCompanyOffer() {
    allOffers = [];
    FirebaseFirestore.instance
        .collection('Offers')
        .doc(uid)
        .collection('Company Offer')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allOffers.add(OfferModel.fromMap(element.data()));
      }
      emit(GetOfferSuccessState());
    }).catchError((e) {
      emit(GetOfferErrorState());
    });
  }

  deleteOffer(int id) {
    FirebaseFirestore.instance
        .collection('Offers')
        .doc(uid)
        .collection('Company Offer')
        .doc('$id')
        .delete()
        .then((value) {
      FirebaseFirestore.instance
          .collection('All Offers')
          .doc('$id')
          .delete()
          .then((value) {
        emit(DeleteOfferSuccessState());
      }).catchError((e) {
        emit(DeleteOfferErrorState());
      });
    }).catchError((e) {
      emit(DeleteOfferErrorState());
    });
  }

  updateCompanyCashback(CompanyModel user, double cashback) {
    emit(UpdateCashbackLoadingState());
    CompanyModel companyModel = CompanyModel(
        user.email,
        user.name,
        user.password,
        user.id,
        user.image,
        user.deviceToken,
        user.type,
        user.uid,
        user.phone,
        user.category,
        user.supportType,
        cashback);
    FirebaseFirestore.instance
        .collection('Company')
        .doc(user.uid)
        .update(companyModel.toMap()!)
        .then((value) {
      emit(UpdateCashbackSuccessState());
    }).catchError((e) {
      emit(UpdateCashbackErrorState());
    });
  }

  addProduct(String name, String description, double amount, String image,
      String productType) {
    emit(AddProductLoadingState());
    int id = getRandomNumber();
    ProductModel productModel =
        ProductModel(id, name, image, productType, amount, description, true);
    FirebaseFirestore.instance
        .collection('Products')
        .doc(uid)
        .collection('Company Products')
        .doc('$id')
        .set(productModel.toMap())
        .then((value) {
      emit(AddProductSuccessState());
    }).catchError((e) {
      emit(AddProductErrorState());
    });
  }

  List<ProductModel> allProducts = [];
  getCompanyProducts() {
    allProducts = [];
    FirebaseFirestore.instance
        .collection('Products')
        .doc(uid)
        .collection('Company Products')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allProducts.add(ProductModel.fromMap(element.data()));
      }
      emit(GetProductSuccessState());
    }).catchError((e) {
      emit(GetProductErrorState());
    });
  }

  File? productImage;
  Future<void> getProductImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      emit(PikProductImageSuccessState());
      uploadProductImage();
    } else {
      print('no image selected');
      emit(PikProductImageErrorState());
    }
  }

  String productImageUri = '';
  uploadProductImage() {
    FirebaseStorage.instance
        .ref()
        .child(
            'product/images/${Uri.file(productImage!.path).pathSegments.last}')
        .putFile(productImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        productImageUri = value;
        emit(UploadProductImageSuccessState());
      }).catchError((e) {
        emit(UploadProductImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProductImageErrorState());
      print(error.toString());
    });
  }

  String? productType;
  selectProductType(String type) {
    productType = type;
    emit(SelectProductTypeState());
  }

  changeProductStatus(ProductModel product, bool status) {
    FirebaseFirestore.instance
        .collection('Products')
        .doc(uid)
        .collection('Company Products')
        .doc('${product.id!}')
        .update({'status': status}).then((value) {
      emit(UpdateProductStatusSuccessState());
    }).catchError((e) {
      emit(UpdateProductStatusErrorState());
    });
  }
}
