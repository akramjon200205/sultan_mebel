import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

class ClientContainerWidget extends StatelessWidget {
  const ClientContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textColorBlack,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ibrohimov Jamoliddin",
                style: AppTextStyles.body14w5.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                "+998888116646",
                style: AppTextStyles.body14w5.copyWith(
                  color: AppColors.white,
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
    );
  }
}
