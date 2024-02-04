// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/home/presentation/bloc/home_bloc.dart';
import 'package:sultan_mebel/future/product/presentation/bloc/product_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/wigets/find_by_id_name.dart';

import 'save_dialog_widget.dart';

// ignore: must_be_immutable
class ChoosenCategoryContainerWidget extends StatefulWidget {
  final int? productsId;
  final int? categoryId;
  const ChoosenCategoryContainerWidget({
    Key? key,
    this.productsId,
    this.categoryId,
  }) : super(key: key);

  @override
  State<ChoosenCategoryContainerWidget> createState() => _ChoosenCategoryContainerWidgetState();
}

class _ChoosenCategoryContainerWidgetState extends State<ChoosenCategoryContainerWidget> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productSizeController = TextEditingController();
  Map<int, String> request = {};
  List<String>? categoryNameList = [];
  int? categoryId;
  String dropValue = "";

  Future<void> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        var contextBloc = context.read<ProductBloc>().state.productsModel;
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          child: SaveProductDialog(
            onTap: () {
              context.read<ProductBloc>().add(
                    ProductPostEvent(
                      productNameController.text.isEmpty ? contextBloc?.name : productNameController.text,
                      productPriceController.text.isEmpty
                          ? contextBloc?.price
                          : double.parse(productPriceController.text),
                      productSizeController.text.isEmpty ? contextBloc?.sizes : productSizeController.text,
                      categoryId,
                      widget.productsId,
                    ),
                  );
              context.read<WarehouseBloc>().add(const WarehouseEvent());
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void getCategory() {
    final categoryList = context.read<HomeBloc>().state.categoryList;
    if (categoryList != null) {
      categoryNameList = categoryList.map((e) {
        log("${e.name}");
        return e.name!;
      }).toList();
    }
    // ignore: prefer_for_elements_to_map_fromiterable
    request = Map.fromIterable(
      categoryList!,
      key: (element) => element.id,
      value: (element) => element.name,
    );

    request.forEach((id, name) {
      log("Category ID: $id, Category Name: $name");
    });
    if (categoryNameList!.isNotEmpty) {
      dropValue = findNameById(widget.categoryId!, request);
    }
  }

  @override
  void initState() {
    super.initState();
    getCategory();
    categoryId = findIdByName(dropValue, request);
    log("$categoryId");
    if (categoryNameList!.isNotEmpty) {
      log("First category name: ${categoryNameList?[0]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    var contextBloc = context.read<ProductBloc>().state.productsModel;
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
            hintTextTextField: contextBloc?.name ?? "Maxsulot nomini kiriting",
            controller: productNameController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomDialogTextFieldContainer(
              textFieldName: "Narxi",
              hintTextTextField: contextBloc?.price.toString() ?? "Maxsulot narxini kiriting",
              controller: productPriceController,
              keyboardType: TextInputType.number,
            ),
          ),
          CustomDialogTextFieldContainer(
            textFieldName: "O'lchami",
            hintTextTextField: contextBloc?.sizes ?? "Maxsulot o'lchamini kiriting",
            controller: productSizeController,
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
                    items: categoryNameList?.map<DropdownMenuItem<String>>((String value) {
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
                        categoryId = findIdByName(dropValue, request);
                      });
                      log("$categoryId");
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
