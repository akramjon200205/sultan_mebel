// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';

class SaveProductDialog extends StatelessWidget {
  final Function() onTap;
  const SaveProductDialog({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Ushbu amalni tasdqilaysizmi?",
            style: AppTextStyles.body18w4.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonContainer(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 120,
                height: 40,
                color: AppColors.textColorBlack,
                textButton: "Bekor qilish",
                textColor: AppColors.white,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CustomButtonContainer(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 120,
                height: 40,
                color: AppColors.yellow,
                textButton: "Tasdiqlash",
                textColor: AppColors.textColorBlack,
                onTap: () => onTap(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
