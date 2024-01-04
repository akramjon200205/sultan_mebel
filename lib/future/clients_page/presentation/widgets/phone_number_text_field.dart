// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class PhoneNumberTextField extends StatelessWidget {
  String textFieldName;

  PhoneNumberTextField({
    Key? key,
    required this.textFieldName,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

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
        TextFormField(
          controller: controller,
          style: AppTextStyles.body18w4.copyWith(
            color: AppColors.grey,
          ),
          inputFormatters: [
            MaskTextInputFormatter(
              mask: '+998 (##) ### ## ##',
              filter: {"#": RegExp(r'[0-9]')},
            ),
          ],
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
            hintText: '+998 (--)  --- -- --',
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
