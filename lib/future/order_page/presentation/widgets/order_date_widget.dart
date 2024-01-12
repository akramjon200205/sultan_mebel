import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/components/sales_order_container_widget.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/text_widget.dart';

class OrderDateWidget extends StatelessWidget {
  const OrderDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSalesOrderContainerWidget(
      child: Column(
        children: [
          CustomRowText(
            mainText: "O'lchov sanasi: ",
            subText: "02.02.2024",
          ),
          CustomRowText(
            mainText: "O'rnatish sanasi: ",
            subText: "02.02.2024",
          ),
          CustomRowText(
            mainText: "Yangilangan sana: ",
            subText: "02.02.2024",
          ),
        ],
      ),
    );
  }
}
