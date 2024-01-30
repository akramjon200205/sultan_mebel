// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/product/presentation/bloc/product_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/wigets/find_by_id_name.dart';

class KirimDialog extends StatefulWidget {
  final int? idProduct;

  const KirimDialog({
    Key? key,
    this.idProduct,
  }) : super(key: key);

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
  Map<int, String>? request = {};
  List<String>? branchNameList = [];
  String dropValue = "";

  void getBranchs() {
    final categoryList = context.read<WarehouseBloc>().state.branchList;
    if (categoryList != null) {
      for (var element in categoryList) {
        branchNameList?.add(element.branch?.name ?? '');
      }
    }
    // ignore: prefer_for_elements_to_map_fromiterable
    request = Map.fromIterable(
      categoryList!,
      key: (element) => element.branch.id,
      value: (element) => element.branch?.name,
    );

    if (branchNameList!.isNotEmpty) {
      dropValue = branchNameList![0];
    }
  }

  @override
  void initState() {
    super.initState();
    getBranchs();
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
            keyboardType: TextInputType.number,
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
                items: branchNameList?.map<DropdownMenuItem<String>>((String value) {
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
            onTap: () {
              log("$dropValue: ${findIdByName(dropValue, request!)}");
              log("prodict Id: ${widget.idProduct}");
              context.read<ProductBloc>().add(
                    ProductPutAmount(
                      findIdByName(dropValue, request!),
                      controller.text.isNotEmpty ? int.parse(controller.text) : 0,
                      widget.idProduct,
                    ),
                  );

              Navigator.pop(context);
            },
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
