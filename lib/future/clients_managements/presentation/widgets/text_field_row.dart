// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

class TextFieldRow extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String textFieldName;
  TextFieldRow({
    Key? key,
    required this.textFieldName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textFieldName,
          style: AppTextStyles.body14w3.copyWith(
            color: AppColors.greyTextColor,
          ),
        ),
        TextField(
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
            hintStyle: AppTextStyles.body14w4.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
