// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class CustomTextFieldContainer extends StatelessWidget {
  String textFieldName;
  String hintTextTextField;
  TextEditingController controller;
  CustomTextFieldContainer({
    Key? key,
    required this.textFieldName,
    required this.hintTextTextField,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldName,
          style: AppTextStyles.body18w4.copyWith(color: AppColors.greyTextColor),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          controller: controller,
          style: AppTextStyles.body18w4.copyWith(
            color: AppColors.grey,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.customContainerColor,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppColors.grey,
                width: 1,
              ),
            ),
            hintText: hintTextTextField,
            hintStyle: AppTextStyles.body18w4.copyWith(
              color: AppColors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }
}
