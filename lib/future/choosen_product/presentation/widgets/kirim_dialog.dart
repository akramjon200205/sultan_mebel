import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/common/components/custom_text_field_container.dart';

class KirimDialog extends StatefulWidget {
  const KirimDialog({super.key});

  @override
  State<KirimDialog> createState() => _KirimDialogState();
}

class _KirimDialogState extends State<KirimDialog> {
  TextEditingController controller = TextEditingController();
  List<String> dropListValue = [
    "Umumiy",
    "Oshhona",
    "Uy",
    "Mebel",
    "Savdo",
  ];
  String dropValue = "";

  @override
  void initState() {
    super.initState();
    dropValue = dropListValue[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDialogTextFieldContainer(
            textFieldName: "Miqdor",
            hintTextTextField: "Miqdor",
            controller: controller,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 35,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.textColorBlack,
              border: Border.all(color: AppColors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: AppColors.textColorBlack,
                value: dropValue,
                isDense: true,
                style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
                items: dropListValue.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppTextStyles.body13w4.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    dropValue = value!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonContainer(
            color: AppColors.yellow,
            textButton: "Saqlash",
            textColor: AppColors.textColorBlack,
            onTap: () {},
            width: 150,
            height: 42,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonContainer(
            color: AppColors.textColorBlack,
            textButton: "Tozalash",
            textColor: AppColors.white,
            onTap: () {
              controller.clear();
              Navigator.of(context).pop();
            },
            width: 150,
            height: 42,
          ),
        ],
      ),
    );
  }
}
