import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/data/models/store_category_model.dart';

class StoreModel {
  String storeName;
  String storeIamge;
  StoreCategoryModel storeCategory;
  List<ProductModel> products;
  StoreModel({
    required this.storeName,
    required this.storeIamge,
    required this.storeCategory,
    required this.products,
  });

  
}
