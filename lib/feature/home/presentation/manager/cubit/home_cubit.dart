import 'dart:math';
import 'package:UQPay/core/functions/Notification_helper.dart';
import 'package:UQPay/core/functions/get_operation_date_now.dart';
import 'package:UQPay/core/functions/get_random_number.dart';
import 'package:UQPay/feature/company/data/company_model.dart';
import 'package:UQPay/feature/company/data/offer_model.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:UQPay/feature/home/data/models/notification.dart';
import 'package:UQPay/feature/home/data/models/operation.dart';
import 'package:UQPay/feature/home/data/models/target_model.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../../core/functions/toast.dart';
import '../../../../../core/utils/common.dart';
import '../../../../admin/data/category_model.dart';
import '../../../../admin/data/machine_position_model.dart';
import '../../../data/models/user_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit getCubit(context) => BlocProvider.of(context);

  // get user information
  UserModel? userModel;
  void getUser(String uid) {
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(uid).get().then((value) {
      userModel = UserModel.fromMap(value.data()!);
      isCardStop = userModel!.isCardStop!;
      isPaymentStop = userModel!.isPaymentStop!;
      emit(HomeGetUserSuccessState());
    }).catchError((e) {
      emit(HomeGetUserErrorState());
    });
  }

// use the returned token to send messages to users from your custom server
  String? token;
  getUserNotificationToken() async {
    token = await FirebaseMessaging.instance.getToken();
    updateUserNotificationToken(userModel!, token!);
  }

  updateUserNotificationToken(UserModel user, String token) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .update({'deviceToken': token}).then((value) {
      emit(HomeUpdateTokenSuccessState());
    }).catchError((e) {
      emit(HomeUpdateTokenErrorState());
    });
  }

  // save account methods
  double targetAmount = 0;
  calculateTarget(double amount, int numMonth) {
    targetAmount = amount * numMonth;
    emit(HomeCalculateTargetState());
  }

  addNewTarget(double amount, int numMonth, int day, String name) {
    emit(HomeAddTargetLoadingState());
    int targetId = getRandomNumber();
    TargetModel newTarget = TargetModel(
        targetId, numMonth, day, amount, targetAmount, amount, name, false);
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid)
        .collection('Targets')
        .doc('$targetId')
        .set(newTarget.toMap()!)
        .then((value) {
      emit(HomeAddTargetSuccessState());
      toast(message: 'Target added successfully', data: ToastStates.success);
    }).catchError((e) {
      emit(HomeAddTargetErrorState());
      toast(message: e.toString(), data: ToastStates.error);
    });
  }

  // edit target
  editTarget(double amount, int numMonth, int day, String name, int targetId) {
    emit(HomeEditTargetLoadingState());
    calculateTarget(amount, numMonth);
    TargetModel newTargetEdited = TargetModel(
        targetId, numMonth, day, amount, targetAmount, amount, name, false);
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid)
        .collection('Targets')
        .doc('$targetId')
        .update(newTargetEdited.toMap()!)
        .then((value) {
      emit(HomeEditTargetSuccessState());
      toast(message: 'Target Edited successfully', data: ToastStates.success);
    }).catchError((e) {
      emit(HomeEditTargetErrorState());
      toast(message: e.toString(), data: ToastStates.error);
    });
  }

  // delete target
  deleteTarget(int targetId) {
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid)
        .collection('Targets')
        .doc('$targetId')
        .delete()
        .then((value) {
      emit(HomeDeleteTargetSuccessState());
    }).catchError((e) {
      emit(HomeDeleteTargetErrorState());
      toast(message: e.toString(), data: ToastStates.error);
    });
  }
  achieveTarget(int targetId) {
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid)
        .collection('Targets')
        .doc('$targetId')
        .delete()
        .then((value) {
      emit(AchieveTargetSuccessState());
    }).catchError((e) {
      emit(AchieveTargetErrorState());
      toast(message: e.toString(), data: ToastStates.error);
    });
  }

  List<TargetModel> allTargets = [];
  getUserTargets(String uid) {
    emit(HomeGetTargetLoadingState());
    allTargets = [];
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid)
        .collection('Targets')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allTargets.add(TargetModel.fromMap(element.data()));
      }
      emit(HomeGetTargetSuccessState());
      //toast(message:'Target added successfully', data: ToastStates.success);
    }).catchError((e) {
      emit(HomeGetTargetErrorState());
      toast(message: e.toString(), data: ToastStates.error);
    });
  }

  // get all users to make transfer
  List<UserModel> allUsers = [];
  getAllUsers() {
    emit(HomeAllGetUserLoadingState());
    allUsers = [];
    FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isNotEqualTo: uid)
        .get()
        .then((value) {
      for (var element in value.docs) {
        allUsers.add(UserModel.fromMap(element.data()));
      }
      emit(HomeAllGetUserSuccessState());
    }).catchError((e) {
      emit(HomeAllGetUserErrorState());
    });
  }

  // get all students users to make transfer
  List<UserModel> allStudent = [];
  getAllStudents() {
    allStudent = [];
    FirebaseFirestore.instance
        .collection('Users')
        .where('userType', isEqualTo: 'Student')
        .get()
        .then((value) {
      for (var element in value.docs) {
        UserModel student = UserModel.fromMap(element.data());
        if (student.uid != uid) {
          allStudent.add(UserModel.fromMap(element.data()));
        }
      }
      emit(HomeGetAllStudentSuccessState());
    }).catchError((e) {
      emit(HomeGetAllStudentErrorState());
    });
  }

  UserModel? selectedTransferUser;
  changeSelectedTransferUser(UserModel value) {
    selectedTransferUser = value;
    emit(HomeChangeSelectedNameState());
  }

  UserModel? selectedSendGiftUser;
  changeSelectedSendGiftUser(UserModel value) {
    selectedSendGiftUser = value;
    emit(ChangeSendGiftUserState());
  }

  UserModel? selectedFavTransferUser;
  changeSelectedFavTransferUser(UserModel value) {
    selectedFavTransferUser = value;
    emit(HomeChangeSelectedNameState());
  }

  transferMoney(UserModel user, double amount) {
    emit(HomeTransferLoadingState());
    var operationId = getRandomNumber();
    var operationDate = getOperationDateNow();
    Operation senderOperation = Operation(
        user.name,
        userModel!.name,
        operationId,
        'You transfer money',
        operationDate,
        amount,
        'Send',
        'Transfer');
    Operation receiverOperation = Operation(
        user.name,
        userModel!.name,
        operationId,
        'You received money',
        operationDate,
        amount,
        'Receive',
        'Transfer');

    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(uid)
        .collection('Operation')
        .doc('$operationId')
        .set(senderOperation.toMap()!)
        .then((value) {
      emit(HomeTransferSuccessState());
      updateUserMoney(userModel!, amount, 'send');
    }).catchError((e) {
      emit(HomeTransferErrorState());
    });
    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(user.uid)
        .collection('Operation')
        .doc('$operationId')
        .set(receiverOperation.toMap()!)
        .then((value) {
      emit(HomeTransferSuccessState());
      updateUserMoney(user, amount, 'receive');
      sendNotificationDB(
          user, 'You received money', 'check it now', 'Transfer', '');
    }).catchError((e) {
      emit(HomeTransferErrorState());
    });
  }

  // notification
  sendNotificationDB(
      UserModel user, String title, String message, String type, String image) {
    int notifyId = getRandomNumber();
    String date = getOperationDateNow();
    NotificationModel notificationModel =
        NotificationModel(notifyId, title, message, date, type, image, false);
    FirebaseFirestore.instance
        .collection('Notification')
        .doc(user.uid)
        .collection('User notification')
        .doc('${notificationModel.notifyId}')
        .set(notificationModel.toMap()!)
        .then((value) {
      if (user.deviceToken != '') {
        NotificationsHelper().sendNotifications(
          fcmToken: user.deviceToken!,
          title: title,
          body: message,
          type: type,
        );
      }
      emit(HomeSendNotificationSuccessState());
    }).catchError((e) {
      emit(HomeSendNotificationErrorState());
    });
  }

  List<NotificationModel> allNotification = [];
  bool isNotificationOpened = true;
  int notificationCounter = 0;
  getNotificationDB() {
    allNotification = [];
    notificationCounter = 0;
    FirebaseFirestore.instance
        .collection('Notification')
        .doc(uid)
        .collection('User notification')
        .get()
        .then((value) {
      for (var element in value.docs) {
        NotificationModel notificationModel =
            NotificationModel.fromMap(element.data());
        allNotification.add(NotificationModel.fromMap(element.data()));
        if (notificationModel.isOpened == false) {
          notificationCounter++;
          isNotificationOpened = false;
        }
      }
      emit(HomeGetNotificationSuccessState());
    }).catchError((e) {
      emit(HomeGetNotificationErrorState());
    });
  }

  // get user operations
  List<Operation> allOperation = [];
  getUserOperation() {
    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(uid)
        .collection('Operation')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allOperation.add(Operation.fromMap(element.data()));
      }
      emit(HomeGetUserOperationSuccessState());
    }).catchError((e) {
      emit(HomeGetUserOperationErrorState());
    });
  }

// update user transfer money
  updateUserMoney(UserModel user, double amount, String type) {
    double newAmount;
    if (type == 'send') {
      newAmount = user.cardAmount! - amount;
    } else {
      newAmount = user.cardAmount! + amount;
    }
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .update({'cardAmount': newAmount}).then((value) {
      emit(HomeUpdateMoneySuccessState());
    }).catchError((e) {
      emit(HomeUpdateMoneyErrorState());
    });
  }

  String? selectedFavFastTransferUser;
  changeSelectedFastTransferUser(String value) {
    selectedFavFastTransferUser = value;
    emit(HomeChangeSelectedFastTransferUserState());
  }

  addUserToFastTransfer(String name) {
    emit(HomeAddFastTransferLoadingState());
    UserModel? user;
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers[i].name == name) {
        user = allUsers[i];
        break;
      }
    }
    FirebaseFirestore.instance
        .collection('Fast Transfer')
        .doc(uid)
        .collection('User Account')
        .doc(user!.uid)
        .set(user.toMap()!)
        .then((value) {
      emit(HomeAddFastTransferSuccessState());
    }).catchError((e) {
      emit(HomeAddFastTransferErrorState());
    });
  }

  List<UserModel> allFastTransferUsers = [];
  getFastTransferUsers() {
    allFastTransferUsers = [];
    FirebaseFirestore.instance
        .collection('Fast Transfer')
        .doc(uid)
        .collection('User Account')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allFastTransferUsers.add(UserModel.fromMap(element.data()));
      }
      emit(HomeGetFastTransferSuccessState());
    }).catchError((e) {
      emit(HomeGetFastTransferErrorState());
    });
  }

  double giftAmount = 0.00;
  changeGiftAmount(double amount) {
    giftAmount = amount;
    emit(HomeChangeGiftAmountState());
  }

  String giftMessage = '';
  changeGiftMessage(String message) {
    giftMessage = message;
    emit(HomeChangeGiftMessageState());
  }

  String giftName = '';
  changeGiftName(String name) {
    giftName = name;
    emit(HomeChangeGiftNameState());
  }

  sendGift(UserModel user, double amount, String message, String name) {
    emit(HomeSendGiftLoadingState());
    var operationId = getRandomNumber();
    var operationDate = getOperationDateNow();
    Operation senderOperation = Operation(user.name, userModel!.name,
        operationId, 'You send gift', operationDate, amount, 'Send', 'Gift');
    Operation receiverOperation = Operation(
        user.name,
        userModel!.name,
        operationId,
        'You received gift',
        operationDate,
        amount,
        'Receive',
        'Gift');
    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(uid)
        .collection('Operation')
        .doc('$operationId')
        .set(senderOperation.toMap()!)
        .then((value) {
      emit(HomeSendGiftSuccessState());
      updateUserMoney(userModel!, amount, 'send');
    }).catchError((e) {
      emit(HomeSendGiftErrorState());
    });
    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(user.uid)
        .collection('Operation')
        .doc('$operationId')
        .set(receiverOperation.toMap()!)
        .then((value) {
      emit(HomeSendGiftSuccessState());
      updateUserMoney(user, amount, 'receive');
      if (user.deviceToken != '') {
        NotificationsHelper().sendNotifications(
          fcmToken: user.deviceToken!,
          title: 'You received money',
          body: 'check it now',
          type: 'Gift',
        );
      }
      sendNotificationDB(
          user, 'You received money', 'check it now', 'Gift', '');
    }).catchError((e) {
      emit(HomeSendGiftErrorState());
    });
  }

  // get all gifts
  bool isReceivedGift = false;
  bool isSendGift = false;
  List<Operation> allReceivedGifts = [];
  List<Operation> allSendGifts = [];
  getAllGifts() {
    emit(HomeGetGiftLoadingState());
    allReceivedGifts = [];
    allSendGifts = [];
    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(uid)
        .collection('Operation')
        .where('serviceType', isEqualTo: 'Gift')
        .get()
        .then((value) {
      for (var element in value.docs) {
        Operation operation = Operation.fromMap(element.data());
        if (operation.type == 'Receive') {
          isReceivedGift = true;
          allReceivedGifts.add(Operation.fromMap(element.data()));
        }
        if (operation.type == 'Send') {
          isSendGift = true;
          allSendGifts.add(Operation.fromMap(element.data()));
        }
      }
      emit(HomeGetGiftSuccessState());
    }).catchError((e) {
      emit(HomeGetGiftErrorState());
    });
  }

  List<UserModel> admin = [];
  void getAdmin() {
    admin = [];
    FirebaseFirestore.instance.collection('Admins').get().then((value) {
      for (var ad in value.docs) {
        admin.add(UserModel.fromMap(ad.data()));
      }
      emit(GetAdminSuccessState());
    }).catchError((e) {
      emit(GetAdminErrorState());
    });
  }

  rechargeCard() {
    NotificationsHelper().sendNotifications(
      fcmToken: admin.first.deviceToken!,
      title: 'Recharge my card ${userModel!.name!}',
      body: userModel!.cardNumber!,
      type: 'Recharge',
    );

    sendNotificationDB(admin.first, 'Recharge my card ${userModel!.name!}',
        userModel!.cardNumber!, 'Recharge', '');
    emit(RechargeCardState());
  }

  List<CategoryModel> allCategory = [];
  getAllCategory() {
    allCategory = [];
    FirebaseFirestore.instance.collection('Category').get().then((value) {
      for (var element in value.docs) {
        allCategory.add(CategoryModel.fromMap(element.data()));
      }
      emit(GetCategorySuccessState());
    }).catchError((e) {
      emit(GetCategoryErrorState());
    });
  }

  List<CompanyModel> allCompany = [];
  getAllCompany() {
    allCompany = [];
    FirebaseFirestore.instance.collection('Company').get().then((value) {
      for (var element in value.docs) {
        allCompany.add(CompanyModel.fromMap(element.data()));
      }
      emit(GetCompanySuccessState());
    }).catchError((e) {
      emit(GetCompanyErrorState());
    });
  }

  List<CompanyModel> allCertainCateCompany = [];
  getCertainCategoryCompany(String category) {
    emit(GetCertainCateCompanyLoadingState());
    allCertainCateCompany = [];
    for (var e in allCompany) {
      if (e.category == category) {
        allCertainCateCompany.add(e);
      }
    }
    emit(GetCertainCateCompanyState());
  }

  List<ProductModel> allCertainCompanyProducts = [];
  getCertainCompanyProduct(String companyId) {
    emit(GetCertainCompanyProductsLoadingState());
    allCertainCompanyProducts = [];
    FirebaseFirestore.instance
        .collection('Products')
        .doc(companyId)
        .collection('Company Products')
        .get()
        .then((value) {
      for (var element in value.docs) {
        ProductModel productModel = ProductModel.fromMap(element.data());
        if (productModel.status == true) {
          allCertainCompanyProducts.add(ProductModel.fromMap(element.data()));
        }
      }
      emit(GetCertainCompanyProductsSuccessState());
    }).catchError((e) {
      emit(GetCertainCompanyProductsErrorState());
    });
  }

  LocationData? currentLocation;
  getCurrentLocation() async {
    final locationController = Location();
    currentLocation = await locationController.getLocation();
    emit(GetCurrentLocationState());
  }

  double calculateDistance(lat1, lon1) {
    var lat2 = currentLocation!.latitude;
    var lon2 = currentLocation!.longitude;
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2! - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2! - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  //// make order and send notification
  makeOrder(
    String orderNumber,
    String orderType,
    String storeId,
    CompanyModel companyModel,
    double amount,
    ProductModel products,
  ) {
    emit(MakeOrderLoadingState());
    String date = getOperationDateNow();
    double cashback = (amount * companyModel.cashback!) / 100;
    double total = amount - cashback;
    OrderModel orderModel = OrderModel(
        userModel,
        userModel!.uid,
        orderNumber,
        orderType,
        storeId,
        companyModel,
        amount,
        products,
        date,
        companyModel.cashback,
        'In Progress',
        total);
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(userModel!.uid!)
        .collection('User Order')
        .doc(orderNumber)
        .set(orderModel.toMap())
        .then((value) {
      emit(MakeOrderSuccessState());
      if (companyModel.deviceToken != '') {
        NotificationsHelper().sendNotifications(
          fcmToken: companyModel.deviceToken!,
          title: 'You have new order',
          body: 'check it now',
          type: 'Order',
        );
      }
      sendCompanyNotificationDB(companyModel, 'You have new order',
          'check it now', 'Order', products.image!);
    }).catchError((e) {
      emit(MakeOrderErrorState());
    });

    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(companyModel.uid!)
        .collection('Company Order')
        .doc(orderNumber)
        .set(orderModel.toMap())
        .then((value) {
      emit(MakeOrderSuccessState());
    }).catchError((e) {
      emit(MakeOrderErrorState());
    });
  }

  reorderOrder(OrderModel order){

    OrderModel orderModel =OrderModel(
        order.userModel,
        order.customerId,
        order.orderNumber,
        order.orderType,
        order.storeId,
        order.companyModel,
        order.amount,
        order.products,
        order.date,
        order.offer,
        "In Progress",
        order.total);

    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(order.companyModel!.uid!)
        .collection('Company Order')
        .doc(order.orderNumber)
        .set(orderModel.toMap())
        .then((value) {
      emit(ReorderSuccessState());
    })
        .catchError((e) {
      emit(ReorderErrorState());
    });
    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(userModel!.uid!)
        .collection('User Order')
        .doc(order.orderNumber)
        .set(orderModel.toMap())
        .then((value) {
      emit(ReorderSuccessState());
      if (order.companyModel!.deviceToken != '') {
        NotificationsHelper().sendNotifications(
          fcmToken: order.companyModel!.deviceToken!,
          title: 'You have new order',
          body: 'check it now',
          type: 'Order',
        );
      }
      sendCompanyNotificationDB(orderModel.companyModel!, 'You have new order',
          'check it now', 'Order', orderModel.products!.image!);
    })
        .catchError((e) {
      emit(ReorderErrorState());
    });

  }

  sendCompanyNotificationDB(CompanyModel user, String title, String message,
      String type, String image) {
    int notifyId = getRandomNumber();
    String date = getOperationDateNow();
    NotificationModel notificationModel =
        NotificationModel(notifyId, title, message, date, type, image, false);
    FirebaseFirestore.instance
        .collection('Notification')
        .doc(user.uid)
        .collection('Company notification')
        .doc('${notificationModel.notifyId}')
        .set(notificationModel.toMap()!)
        .then((value) {
      emit(HomeSendNotificationSuccessState());
    }).catchError((e) {
      emit(HomeSendNotificationErrorState());
    });
  }

  List<MachinePositionModel> allDepositMachine = [];
  List<Marker> allDepositMachineLocation = [];
  getAllDepositMachine() {
    allDepositMachine = [];
    FirebaseFirestore.instance
        .collection('Deposit Machines')
        .get()
        .then((value) {
      for (var e in value.docs) {
        allDepositMachine.add(MachinePositionModel.fromMap(e.data()));
      }
      emit(GetDepositMachineSuccessState());
    }).catchError((e) {
      emit(GetDepositMachineErrorState());
    });
  }

  fillMarker() {
    allDepositMachineLocation = [];
    for (var e in allDepositMachine) {
      allDepositMachineLocation.add(
        Marker(
          markerId: MarkerId(e.name.toString()),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position:
              LatLng(double.parse(e.latitude!), double.parse(e.longitude!)),
          infoWindow: InfoWindow(title: e.name.toString()),
        ),
      );
    }
  }

  List<OrderModel> allUserOrder = [];
  List<OrderModel> allInProgressOrder = [];
  List<OrderModel> allInPastOrder = [];
  getUserOrders() {
    emit(GetOrderUserLoadingState());
    allUserOrder = [];
    allInProgressOrder = [];
    allInPastOrder = [];

    FirebaseFirestore.instance
        .collection('All Orders')
        .doc(userModel!.uid!)
        .collection('User Order')
        .get()
        .then((value) {
      for (var e in value.docs) {
        OrderModel order = OrderModel.fromMap(e.data());
        allUserOrder.add(OrderModel.fromMap(e.data()));
        if (order.status == 'In Progress') {
          allInProgressOrder.add(OrderModel.fromMap(e.data()));
        } else {
          allInPastOrder.add(OrderModel.fromMap(e.data()));
        }
      }
      emit(GetUserOrderSuccessState());
    }).catchError((e) {
      emit(GetUserOrderErrorState());
    });
  }

  List<OfferModel> allOffers = [];
  List<OfferModel> allStudentOffers = [];
  List<OfferModel> allAcademicOffers = [];
  getAllCompanyOffers() {
    allOffers = [];
    allStudentOffers = [];
    allAcademicOffers = [];
    FirebaseFirestore.instance.collection('All Offers').get().then((value) {
      for (var e in value.docs) {
        OfferModel offerModel = OfferModel.fromMap(e.data());
        if(offerModel.offerType=='Student'){
          allStudentOffers.add(OfferModel.fromMap(e.data()));
        }else{
          allAcademicOffers.add(OfferModel.fromMap(e.data()));
        }
      }
      emit(GetAllOffersSuccessState());
    }).catchError((e) {
      emit(GetAllOffersErrorState());
    });
  }
  fillUserOffers(){
    if(userModel!.userType=='Student'){
      allOffers = allStudentOffers;
      emit(ChangeUserOffersState());
    }else{
      allOffers = allAcademicOffers;
      emit(ChangeUserOffersState());
    }
  }

  int current = 0;
  changeCurrentOffer(int index) {
    current = index;
  }

  bool? isCardStop;
  stopCard(bool isStop) {
    isCardStop = isStop;
    emit(StopCardState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update({'isCardStop': isCardStop}).then((value) {
      emit(UpdateCardManageSuccessState());
    }).catchError((e) {
      emit(UpdateCardManageErrorState());
    });
  }

  bool? isPaymentStop;
  stopPayment(bool isStop) {
    isPaymentStop = isStop;
    emit(StopPaymentState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update({'isPaymentStop': isPaymentStop}).then((value) {
      emit(UpdateCardManageSuccessState());
    }).catchError((e) {
      emit(UpdateCardManageErrorState());
    });
  }

  notificationClicked() {
    isNotificationOpened = true;
    emit(NotificationClickedState());
  }

  updateNotificationClicks(NotificationModel notification) {
    FirebaseFirestore.instance
        .collection('Notification')
        .doc(uid)
        .collection('User notification')
        .doc('${notification.notifyId}')
        .update({'isOpened': true}).then((value) {
      emit(UpdateNotificationSuccessState());
    }).catchError((e) {
      emit(UpdateNotificationErrorState());
    });
  }
}
