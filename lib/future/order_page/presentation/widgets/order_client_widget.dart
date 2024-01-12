// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/components/sales_order_container_widget.dart';
import 'package:sultan_mebel/common/utills/extensions.dart';

import 'text_widget.dart';

class OrderClientWidget extends StatelessWidget {
  const OrderClientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSalesOrderContainerWidget(
      child: Column(
        children: [
          CustomRowText(
            mainText: "Mijoz: ",
            subText: " Ibrohimov Jamoliddin",
          ),
          CustomRowText(
            mainText: "Hodim: ",
            subText: " Ibrohimov Jamoliddin",
          ),
          CustomRowText(
            mainText: "Filial: ",
            subText: " Ibrohimov Jamoliddin",
          ),
          CustomRowText(
            mainText: "Ro'yhatga olingan sana: ",
            subText: "02.01.2024",
          ),
          CustomRowText(
            mainText: "Narx: ",
            subText: 1000000.toString().formatAsNumber(),
          ),
          CustomRowText(
            mainText: "Izoh: ",
            subText: " Ibrohimov Jamoliddin",
          ),
        ],
      ),
    );
  }
}
