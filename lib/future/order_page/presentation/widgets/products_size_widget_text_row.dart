import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class ProductsSizeWidgerTextRow extends StatelessWidget {
  int number;
  String productNameText;
  String sizeProduct;
  int productCount;
  ProductsSizeWidgerTextRow({
    Key? key,
    required this.number,
    required this.productNameText,
    required this.sizeProduct,
    required this.productCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text(
              "$number",
              style: AppTextStyles.body14w3.copyWith(
                color: AppColors.white,
              ),
            ),
            Text(
              productNameText,
              style: AppTextStyles.body14w3.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox.shrink(),
        Row(
          children: [
            Text(
              "$productCount",
              style: AppTextStyles.body14w3.copyWith(
                color: AppColors.white,
              ),
            ),
            Text(
              sizeProduct,
              style: AppTextStyles.body14w3.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
