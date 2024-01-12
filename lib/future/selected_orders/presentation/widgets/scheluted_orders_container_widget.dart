// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/utills/extensions.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/custom_container_button.dart';

import '../../../order_page/presentation/widgets/text_widget.dart';

// ignore: must_be_immutable
class SchelutedOrdersContainerWidget extends StatefulWidget {
  String mijozName;
  String qabulQilishSana;
  String royhatgaOlinganSana;
  String summa;
  bool value;
  Function function;

  SchelutedOrdersContainerWidget({
    Key? key,
    required this.mijozName,
    required this.qabulQilishSana,
    required this.royhatgaOlinganSana,
    required this.summa,
    required this.value,
    required this.function,
  }) : super(key: key);

  @override
  State<SchelutedOrdersContainerWidget> createState() => _SchelutedOrdersContainerWidgetState();
}

class _SchelutedOrdersContainerWidgetState extends State<SchelutedOrdersContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          CustomRowText(
            mainText: "Mijoz: ",
            subText: widget.mijozName,
          ),
          CustomRowText(
            mainText: "Qabul qilish sanasi: ",
            subText: widget.qabulQilishSana,
          ),
          CustomRowText(
            mainText: "Ro'yxatdan olingan sana: ",
            subText: widget.royhatgaOlinganSana,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomRowText(
            mainText: "Summa: ",
            subText: widget.summa.toString().formatAsNumber(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Eslatma",
                style: AppTextStyles.body12w4.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Switch(
                value: widget.value,
                inactiveTrackColor: AppColors.customContainerColor,
                inactiveThumbColor: AppColors.greyTextColor,
                activeTrackColor: AppColors.customContainerColor,
                onChanged: (value) {
                  setState(() {
                    widget.value = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomContainerButton(
            margin: EdgeInsets.zero,
            onTap: () => widget.function(),
            color: AppColors.yellow,
            child: Text(
              "Qabul qilish",
              style: AppTextStyles.body14w6.copyWith(
                color: AppColors.textColorBlack,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomContainerButton(
            margin: EdgeInsets.zero,
            onTap: () => widget.function(),
            color: AppColors.textColorBlack,
            child: Text(
              "O'chirish",
              style: AppTextStyles.body14w6.copyWith(
                color: AppColors.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
