import 'dart:io';
import 'package:UQPay/feature/company/data/offer_model.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:UQPay/feature/home/data/models/notification.dart';
import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import '../../../../core/functions/get_operation_date_now.dart';
import '../../../../core/functions/get_random_number.dart';
import '../../../../core/utils/common.dart';
import '../../../home/data/models/operation.dart';
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
      emit(GetCompanySuccessState());
    }).catchError((e) {
      emit(GetCompanyErrorState());
    });
  }
  LocationData? companyLocation;
  getLocation() async {

    final locationController = Location();
   companyLocation = await locationController.getLocation();
  }

// use the returned token to send messages to users from your custom server
  String? token;
  getCompanyNotificationToken() async {
    await getLocation();
    token = await FirebaseMessaging.instance.getToken();
    updateCompanyNotificationToken(companyModel!, token!,companyLocation!);
  }

  updateCompanyNotificationToken(CompanyModel user, String token,LocationData location) {
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
        user.cashback,
        user.address,
        location.longitude,
        location.latitude,
    );
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
  Future<void> getOfferImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      offerImage = File(pickedFile.path);
      emit(PikOfferImageSuccessState());
      uploadOfferImage();
    } else {
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
        offerImageUri = value;
        emit(UploadOfferImageSuccessState());
      }).catchError((e) {
        emit(UploadOfferImageErrorState());
      });
    }).catchError((error) {
      emit(UploadOfferImageErrorState());
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
  int current = 0;
  changeCurrentOffer(int index){
    current = index;
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
        cashback,
      user.address,
      user.longitude,
      user.latitude
    );
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
        productImageUri = value;
        emit(UploadProductImageSuccessState());
      }).catchError((e) {
        emit(UploadProductImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProductImageErrorState());
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


  List<NotificationModel> allCompanyNotification =[];
  getCompanyNotifications(){
    allCompanyNotification =[];
    FirebaseFirestore.instance
        .collection('Notification')
        .doc(companyModel!.uid!)
        .collection('Company notification')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allCompanyNotification.add(NotificationModel.fromMap(element.data()));
      }
      emit(GetNotificationSuccessState());
    })
        .catchError((e) {
      emit(GetNotificationErrorState());
    });
  }
  List<OrderModel> newOrders =[];
  List<OrderModel> allOrders =[];
  List<OrderModel> pastOrders =[];
  getCompanyOrders(){
    newOrders =[];
    pastOrders =[];
    allOrders =[];
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(companyModel!.uid!)
        .collection('Company Order')
        .get()
        .then((value) {
      for (var element in value.docs) {
        OrderModel order =OrderModel.fromMap(element.data());
        if(order.status=='In Progress'){
          newOrders.add(OrderModel.fromMap(element.data()));
        }else{
          pastOrders.add(OrderModel.fromMap(element.data()));
        }
        allOrders.add(OrderModel.fromMap(element.data()));
      }
      emit(GetOrdersSuccessState());
    })
        .catchError((e) {
      emit(GetOrdersErrorState());
    });
  }

  acceptOrder(String orderNumber, UserModel userModel ,double amount,double offer){
    emit(AcceptOrderLoadingState());
    double cashback = (amount*offer)/100;
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(companyModel!.uid!)
        .collection('Company Order')
        .doc(orderNumber)
        .update({
      'status': 'Accepted'
    })
        .then((value) {
      emit(AcceptOrderSuccessState());
    })
        .catchError((e) {
      emit(AcceptOrderErrorState());
    });
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(userModel.uid!)
        .collection('User Order')
        .doc(orderNumber)
        .update({
      'status': 'Accepted'
    })
        .then((value) {
      emit(AcceptOrderSuccessState());
      updateUserMoney(userModel, amount,cashback);
      userOperation(userModel, companyModel!, orderNumber, amount);
    })
        .catchError((e) {
      emit(AcceptOrderErrorState());
    });

  }

  rejectOrder(String orderNumber, UserModel userModel){
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(companyModel!.uid!)
        .collection('Company Order')
        .doc(orderNumber)
        .update({
      'status': 'Rejected'
    })
        .then((value) {
      emit(RejectOrderSuccessState());
    })
        .catchError((e) {
      emit(RejectOrderErrorState());
    });
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(userModel.uid!)
        .collection('User Order')
        .doc(orderNumber)
        .update({
      'status': 'Rejected'
    })
        .then((value) {
      emit(RejectOrderSuccessState());
    })
        .catchError((e) {
      emit(RejectOrderErrorState());
    });

  }

  finishOrder(String orderNumber, UserModel userModel){
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(companyModel!.uid!)
        .collection('Company Order')
        .doc(orderNumber)
        .delete()
        .then((value) {
      emit(FinishOrderSuccessState());
    })
        .catchError((e) {
      emit(FinishOrderErrorState());
    });
  }

  updateUserMoney(UserModel user, double amount, double cashback) {
    double newAmount = user.cardAmount! - amount;
    double newCash = user.cashBacks! + cashback;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .update({
      'cashBacks':newCash,
      'cardAmount':newAmount
    })
        .then((value) {
      emit(UpdateUserSuccessState());
    })
        .catchError((e) {
      emit(UpdateUserErrorState());
    });
  }

  userOperation(UserModel user,CompanyModel company,String orderNumber,double amount){
    var operationDate = getOperationDateNow();
    Operation operation = Operation(
        company.name,
        user.name,
        int.parse(orderNumber),
        'You pay money',
        operationDate,
        amount,
        'Send',
        'Payment');

    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(uid)
        .collection('Operation')
        .doc(orderNumber)
        .set(operation.toMap()!)
        .then((value) {
      emit(AddUserOperationSuccessState());
    })
        .catchError((e) {
      emit(AddUserOperationErrorState());
    });
  }

  bool pushNotification = true;
  changePushNotification(){
    pushNotification =!pushNotification;
    emit(GetPushNotificationState());
  }


}
