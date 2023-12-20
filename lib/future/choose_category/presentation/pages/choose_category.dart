import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/custom_app_bar_action_widget.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/choose_category/presentation/wigets/choose_category_grid_view_widget.dart';
import 'package:sultan_mebel/future/home/data/local_type_mebel_data.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({super.key});

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  TextEditingController showDialogController = TextEditingController();
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

  Future<void> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.symmetric(horizontal: 25),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomDialogTextFieldContainer(
                  textFieldName: "Description",
                  hintTextTextField: "Input something",
                  controller: showDialogController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDialogTextFieldContainer(
                  textFieldName: "Description",
                  hintTextTextField: "Input something",
                  controller: showDialogController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDialogTextFieldContainer(
                  textFieldName: "Description",
                  hintTextTextField: "Input something",
                  controller: showDialogController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonContainer(
                  color: AppColors.yellow,
                  textButton: "Saqlash",
                  textColor: AppColors.textColorBlack,
                  onTap: () {
                    if (showDialogController.text.isNotEmpty) {
                      DataTypesMebelList().mebel.add(showDialogController.text);
                      setState(() {});
                      log(DataTypesMebelList().mebel.last);
                      showDialogController.clear();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonContainer(
                  color: AppColors.textColorBlack,
                  textButton: "Bekor qilish",
                  textColor: AppColors.white,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 35,
                  width: 150,
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
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ChooseCategoryGridViewWidget(
                onTap: () {
                  showMyDialog();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
