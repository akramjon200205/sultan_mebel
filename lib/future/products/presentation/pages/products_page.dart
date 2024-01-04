import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/products/presentation/wigets/products_grid_view_widget.dart';

class ChoosenCategory extends StatefulWidget {
  const ChoosenCategory({super.key});

  @override
  State<ChoosenCategory> createState() => _ChoosenCategoryState();
}

class _ChoosenCategoryState extends State<ChoosenCategory> {
  TextEditingController showDialogController = TextEditingController();
  int itemCount = 6;
  List<String> dropListValue = [
    "Umumiy",
    "Oshhona",
    "Uy",
    "Mebel",
    "Savdo",
  ];
  String dropValue = "";
  String dropValue1 = "";

  @override
  void initState() {
    super.initState();
    dropValue = dropListValue[0];
    dropValue1 = dropListValue[0];
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
                  textFieldName: "Maxsulot nomi",
                  hintTextTextField: "Input something",
                  controller: showDialogController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDialogTextFieldContainer(
                  textFieldName: "Narx",
                  hintTextTextField: "Input something",
                  controller: showDialogController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDialogTextFieldContainer(
                  textFieldName: "O'lcham",
                  hintTextTextField: "Input something",
                  controller: showDialogController,
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kategoriya",
                      style: AppTextStyles.body18w4.copyWith(
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
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
                          value: dropValue1,
                          isDense: true,
                          style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
                          items: dropListValue.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppTextStyles.body18w4.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            );
                          }).toList(),
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              dropValue1 = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonContainer(
                  width: double.infinity,
                  height: 48.h,
                  color: AppColors.yellow,
                  textButton: "Saqlash",
                  textColor: AppColors.textColorBlack,
                  onTap: () {
                    setState(() {
                      itemCount += 1;
                    });
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonContainer(
                  height: 48.h,
                  width: double.infinity,
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
              child: ChoosenCategoryGridViewWidget(
                itemcount: itemCount,
                onTap: () {
                  showMyDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
