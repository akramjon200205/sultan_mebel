// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/product/presentation/bloc/product_bloc.dart';

import 'save_dialog_widget.dart';

// ignore: must_be_immutable
class ChoosenCategoryContainerWidget extends StatefulWidget {
  const ChoosenCategoryContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoosenCategoryContainerWidget> createState() => _ChoosenCategoryContainerWidgetState();
}

class _ChoosenCategoryContainerWidgetState extends State<ChoosenCategoryContainerWidget> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();

  List<String> dropListValue = [
    "Umumiy",
    "Oshhona",
    "Uy",
    "Mebel",
    "Savdo",
  ];
  String dropValue = "";

  Future<void> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          child: SaveProductDialog(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    dropValue = dropListValue[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.textColorDark,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          CustomDialogTextFieldContainer(
            textFieldName: "Maxsulot nomi",
            hintTextTextField:context.read<ProductBloc>().state.productsModel?.name ??  "Maxsulot nomini kiriting",
            controller: firstController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomDialogTextFieldContainer(
              textFieldName: "Narxi",
              hintTextTextField:context.read<ProductBloc>().state.productsModel?.price.toString() ?? "Maxsulot narxini kiriting",
              controller: firstController,
            ),
          ),
          CustomDialogTextFieldContainer(
            textFieldName: "O'lchami",
            hintTextTextField:context.read<ProductBloc>().state.productsModel?.sizes ?? "Maxsulot o'lchamini kiriting",
            controller: firstController,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Kategoriya",
                style: AppTextStyles.body18w4.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 35,
                width: 130,
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
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonContainer(
            height: 48.h,
            width: double.infinity,
            color: AppColors.yellow,
            textButton: "Saqlash",
            textColor: AppColors.textColorBlack,
            onTap: () => showMyDialog(),
          ),
        ],
      ),
    );
  }
}
