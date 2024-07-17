import 'package:flutter/material.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/gift_list_view.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/no_gift_widget.dart';

class ReceivedTabView extends StatelessWidget {
  const ReceivedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return false? GiftListView( isSend: false,):const NoGiftWidget();
  }
}


