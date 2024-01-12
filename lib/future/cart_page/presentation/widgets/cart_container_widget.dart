// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class CartContainerWidget extends StatelessWidget {
  int number;
  TextEditingController controller;
  // Function function;
  CartContainerWidget({
    Key? key,
    required this.number,
    required this.controller,
    // required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 190,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.textColorBlack,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                        hintText: "Maxsulot miqdori",
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
            TextField(
              style: AppTextStyles.body20w5.copyWith(
                color: AppColors.grey,
              ),
              decoration: InputDecoration(
                fillColor: AppColors.customContainerColor,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.greyTextColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Izoh",
                hintStyle: AppTextStyles.body20w5.copyWith(
                  color: AppColors.grey,
                ),
              ),
              minLines: 3,
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
