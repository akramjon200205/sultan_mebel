// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/future/client/presentation/widgets/text_field_row.dart';

// ignore: must_be_immutable
class AcceptSummWidgetContainer extends StatefulWidget {
  TextEditingController textEditingController;
  AcceptSummWidgetContainer({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<AcceptSummWidgetContainer> createState() => _AcceptSummWidgetContainerState();
}

class _AcceptSummWidgetContainerState extends State<AcceptSummWidgetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
        color: AppColors.textColorDark,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "Summa qabul qilish",
            style: AppTextStyles.body20w5.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          // TextFieldRow(
          //   textFieldName: "Description",
          //   controller: widget.textEditingController,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Description",
                style: AppTextStyles.body14w3.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: widget.textEditingController,
                  style: AppTextStyles.body14w4.copyWith(
                    color: AppColors.grey,
                  ),
                  decoration: InputDecoration(
                    fillColor: AppColors.customContainerColor,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                        width: 1,
                      ),
                    ),
                    hintText: "Input something",
                    hintStyle: AppTextStyles.body14w4.copyWith(
                      color: AppColors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButtonContainer(
            height: 42,
            width: double.infinity,
            color: AppColors.yellow,
            textButton: "Saqlash",
            textColor: AppColors.textColorBlack,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
