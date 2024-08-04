
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/data/models/store_model.dart';

class OrderModel {
  String number;
  String orderType;
  StoreModel storeModel;
  double amount;
  List<ProductModel> products;
  OrderModel({
    required this.number,
    required this.orderType,
    required this.storeModel,
    required this.products,
    required this.amount,
  });


}