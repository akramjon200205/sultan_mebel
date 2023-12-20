import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

class OrdersContainerWidget extends StatelessWidget {
  const OrdersContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ibrohimov Jamoliddin",
                    style: AppTextStyles.body18w5.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "+998888116646",
                    style: AppTextStyles.body14w3.copyWith(
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Mars",
                style: AppTextStyles.body11w4.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Text(
            "12.12.2022",
            style: AppTextStyles.body18w5.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
