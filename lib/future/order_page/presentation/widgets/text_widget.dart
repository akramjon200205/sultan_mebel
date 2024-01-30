import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_text_styles.dart';

// ignore: must_be_immutable
class CustomRowText extends StatelessWidget {
  String mainText;
  String subText;
  CustomRowText({
    Key? key,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$mainText:",
          style: AppTextStyles.body16w5.copyWith(
            color: AppColors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          subText,
          style: AppTextStyles.body12w4.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
