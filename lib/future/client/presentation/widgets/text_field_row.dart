// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class TextFieldRow extends StatelessWidget {
  TextEditingController controller;
  String textFieldName;
  TextFieldRow({
    Key? key,
    required this.controller,
    required this.textFieldName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textFieldName,
            style: AppTextStyles.body14w3.copyWith(
              color: AppColors.greyTextColor,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: AppTextStyles.body14w4.copyWith(
                color: AppColors.grey,
              ),
              decoration: InputDecoration(
                  fillColor: AppColors.customContainerColor,
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.grey,
                      width: 1,
                    ),
                  ),
                  hintText: "Input something",
                  hintStyle: AppTextStyles.body14w4.copyWith(
                    color: AppColors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
