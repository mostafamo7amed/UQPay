import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/send_gifts.dart/gift_list_view.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/send_gifts.dart/no_gift_widget.dart';

class ReceivedTabView extends StatelessWidget {
  const ReceivedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return false? GiftListView( isSend: false,):const NoGiftWidget();
  }
}


