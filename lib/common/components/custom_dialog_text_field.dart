// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class CustomDialogTextFieldContainer extends StatelessWidget {
  String textFieldName;
  String hintTextTextField;
  TextEditingController controller;
  final TextInputType? keyboardType;
  CustomDialogTextFieldContainer({
    Key? key,
    required this.textFieldName,
    required this.hintTextTextField,
    required this.controller,
    this.keyboardType,
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
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          style: AppTextStyles.body18w4.copyWith(
            color: AppColors.grey,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.customContainerColor,
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
              vertical: 5,
            ),
          ),
        ),
      ],
    );
  }
}
