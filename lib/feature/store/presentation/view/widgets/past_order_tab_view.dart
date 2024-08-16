import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:flutter/material.dart';

import '../../../data/models/order_model.dart';
import '../../../data/models/store_model.dart';

class PastOrderTabView extends StatelessWidget {
  const PastOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersVerticalListView(
      detailsTap: () {},
      reorderTap: () {},
    );
  }
}
