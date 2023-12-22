import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/future/clients_managements/presentation/widgets/text_field_row.dart';

class AcceptSummWidgetContainer extends StatelessWidget {
  const AcceptSummWidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
        color: AppColors.textColorDark,
      ),
      child: Column(
        children: [
          Text(
            "Summa qabul qilish",
            style: AppTextStyles.body18w5.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFieldRow(
            textFieldName: "Description",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButtonContainer(
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
