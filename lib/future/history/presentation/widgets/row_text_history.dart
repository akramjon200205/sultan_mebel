// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

class RowTextHistoryWidget extends StatelessWidget {
  String textNomi;
  String subNomi;

  RowTextHistoryWidget({
    Key? key,
    required this.textNomi,
    required this.subNomi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$textNomi:",
          style: AppTextStyles.body18w5.copyWith(
            color: AppColors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "$subNomi:",
          style: AppTextStyles.body15w4.copyWith(
            color: AppColors.greyTextColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
