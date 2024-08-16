import 'package:UQPay/feature/company/data/company_model.dart';
import 'package:UQPay/feature/home/data/models/user_model.dart';
import '../../../company/data/product_model.dart';

class OrderModel {
  UserModel? userModel;
  String? customerId;
  String? orderNumber;
  String? orderType;
  String? storeId;
  CompanyModel? companyModel;
  double? amount;
  ProductModel? products;
  String? date;
  double? offer;
  String? status;
  double? total;

  OrderModel(
      this.userModel,
      this.customerId,
      this.orderNumber,
      this.orderType,
      this.storeId,
      this.companyModel,
      this.amount,
      this.products,
      this.date,
      this.offer,
      this.status,
      this.total);
  OrderModel.fromMap(Map<String,dynamic> map){
    userModel =UserModel.fromMap(map['userModel']);
    customerId = map['customerId'];
    orderNumber = map['orderNumber'];
    orderType = map['orderType'];
    storeId = map['storeId'];
    companyModel =CompanyModel.fromMap(map['companyModel']);
    amount = map['amount'];
    products = ProductModel.fromMap(map['products']);
    date = map['date'];
    offer = map['offer'];
    status = map['status'];
    total = map['total'];
  }

  Map<String,dynamic> toMap(){
    return{
      'userModel':userModel!.toMap(),
      'customerId':customerId,
      'orderNumber':orderNumber,
      'orderType':orderType,
      'storeId':storeId,
      'companyModel':companyModel!.toMap(),
      'amount':amount,
      'products':products!.toMap(),
      'date':date,
      'offer':offer,
      'status':status,
      'total':total
    };
  }
}