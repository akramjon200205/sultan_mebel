// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/home/presentation/bloc/home_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';

import '../../../../common/components/custom_button_container.dart';
import '../../../../common/enums/bloc_status.dart';
import '../../../home/data/models/category_model.dart';
import '../bloc/products/products_bloc.dart';
import 'find_by_id_name.dart';

Future<void> showMyProductsDialog(BuildContext context, int index, int idWarehouse, String dropValue) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Dialog(
            backgroundColor: AppColors.textColorBlack,
            alignment: Alignment.topCenter,
            insetPadding: const EdgeInsets.symmetric(horizontal: 25),
            child: ProductsDialogWidget(id: index, idWarehouse: idWarehouse, dropValue: dropValue),
          ),
        ),
      );
    },
  );
}

class ProductsDialogWidget extends StatefulWidget {
  final int id;
  final int idWarehouse;
  final String dropValue;
  const ProductsDialogWidget({
    Key? key,
    required this.id,
    required this.idWarehouse,
    required this.dropValue,
  }) : super(key: key);

  @override
  State<ProductsDialogWidget> createState() => _ProductsDialogWidgetState();
}

class _ProductsDialogWidgetState extends State<ProductsDialogWidget> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productSizeController = TextEditingController();

  List<CategoryModel> dropCategory = [];
  List<String> dropListValue = [];
  Map<int, String> result = {};

  String? dropValue1 = "";

  void getCategories(BuildContext context) {
    dropCategory = context.read<HomeBloc>().state.categoryList ?? [];

    dropListValue.addAll(
      dropCategory.map((e) => e.name ?? ''),
    );

    dropListValue = dropListValue.toSet().toList();

    for (var element in dropCategory) {
      int? id = element.id;
      String? name = element.name;
      if (id != null && name != null) {
        result[id] = name;
      }
    }

    dropValue1 = result[widget.id] ?? '';
  }

  @override
  void initState() {
    super.initState();
    getCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: BlocConsumer<WarehouseBloc, WarehouseState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.statusGetWarehouse == BlocStatus.inProgress) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            );
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomDialogTextFieldContainer(
                textFieldName: "Maxsulot nomi",
                hintTextTextField: "Mahsulot nomi",
                controller: productNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDialogTextFieldContainer(
                textFieldName: "Narx",
                hintTextTextField: "Narxi",
                controller: productPriceController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDialogTextFieldContainer(
                textFieldName: "O'lcham",
                hintTextTextField: "O'lchami",
                controller: productSizeController,
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
                        value: dropValue1 ?? '',
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
                          dropValue1 = value!;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonContainer(
                    width: double.infinity,
                    height: 48,
                    color: AppColors.yellow,
                    textButton: "Saqlash",
                    textColor: AppColors.textColorBlack,
                    onTap: () {
                      if (productNameController.text.isNotEmpty &&
                          productPriceController.text.isNotEmpty &&
                          productSizeController.text.isNotEmpty) {
                        int id = findIdByName(dropValue1!, result);
                        log("$id");
                        log(widget.dropValue);
                        log("${widget.idWarehouse}");

                        context.read<ProductsBloc>().add(
                              ProductPostEvent(
                                productNameController.text,
                                productSizeController.text,
                                id,
                                double.parse(productPriceController.text),
                                state
                                    .branchList?[state.branchNames!.indexWhere(
                                  (element) => element.startsWith(
                                    widget.dropValue,
                                  ),
                                )]
                                    .id,
                              ),
                            );
                        context.read<WarehouseBloc>().add(const WarehouseEvent());
                        productNameController.clear();
                        productPriceController.clear();
                        productSizeController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonContainer(
                    height: 48,
                    width: double.infinity,
                    color: AppColors.textColorBlack,
                    textButton: "Bekor qilish",
                    textColor: AppColors.white,
                    onTap: () {
                      productNameController.clear();
                      productPriceController.clear();
                      productSizeController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
