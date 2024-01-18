import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/text_widget.dart';

class OrdersContainerWidget extends StatelessWidget {
  const OrdersContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.textColorBlack,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRowText(
            mainText: "Id",
            subText: "12345",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomRowText(
              mainText: "Tugallangan sana",
              subText: "12.12.2022",
            ),
          ),
          CustomRowText(
            mainText: "Ibrohimov Jamoliddin",
            subText: "+99888666372",
          ),
          const Spacer(),
          Text(
            "Mars",
            style: AppTextStyles.body11w4.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
  