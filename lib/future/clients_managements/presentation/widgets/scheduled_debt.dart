import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/utills/extensions.dart';
import 'package:sultan_mebel/future/clients_managements/presentation/widgets/text_field_row.dart';

class ScheduletDebt extends StatefulWidget {
  const ScheduletDebt({super.key});

  @override
  State<ScheduletDebt> createState() => _ScheduletDebtState();
}

class _ScheduletDebtState extends State<ScheduletDebt> {
  TextEditingController controller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
        color: AppColors.textColorDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rejalashtirilgan qarzdorlik",
            style: AppTextStyles.body20w5.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldRow(
            controller: controller,
            textFieldName: "Summa",
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sana",
                style: AppTextStyles.body14w3.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: TextField(
                  onTap: () => _selectDate(context).then(
                    (value) => dateController.text = selectedDate.toString().formatDate(),
                  ),
                  readOnly: true,
                  controller: dateController,
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
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
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
