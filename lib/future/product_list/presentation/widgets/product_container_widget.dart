// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

class ProductContainerWidget extends StatelessWidget {
  int number;
  TextEditingController controller;
  Function function;
  ProductContainerWidget({
    Key? key,
    required this.number,
    required this.controller,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.textColorBlack,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Product $number",
              style: AppTextStyles.body18w5.copyWith(
                color: AppColors.white,
              ),
            ),
            SizedBox(
              width: 140,
              height: 35,
              child: Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                        width: 1,
                      ),
                    ),
                    hintText: "Input something",
                    hintStyle: AppTextStyles.body15w4.copyWith(
                      color: AppColors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
