import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:flutter/material.dart';

class InProgressOrderTabView extends StatelessWidget {
  const InProgressOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersVerticalListView(
      hideProgress: true,
    );
  }
}
