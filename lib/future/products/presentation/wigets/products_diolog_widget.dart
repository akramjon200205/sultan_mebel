import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/home/presentation/bloc/home_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/products_bloc.dart';

import '../../../../common/components/custom_button_container.dart';
import '../../../../common/enums/bloc_status.dart';
import '../../../home/data/models/category_model.dart';
import 'find_by_id_name.dart';

Future<void> showMyProductsDialog(BuildContext context, int index) async {
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
            child: ProductsDialogWidget(index: index),
          ),
        ),
      );
    },
  );
}

class ProductsDialogWidget extends StatefulWidget {
  final int index;
  const ProductsDialogWidget({
    super.key,
    required this.index,
  });

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

    if (widget.index >= 0 && widget.index < dropListValue.length) {
      dropValue1 = result[widget.index + 1] ?? ''; // Adjust index if necessary
    } else {
      dropValue1 = ''; // Set to a default value or handle accordingly
    }
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
      child: Column(
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
          BlocConsumer<ProductsBloc, ProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.statusGetProductCategory == BlocStatus.inProgress ||
                  state.statusPostProductCategory == BlocStatus.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                );
              }
              return Column(
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
                      int id = findIdByName(dropValue1!, result);
                      context.read<ProductsBloc>().add(
                            ProductPostEvent(
                              productNameController.text,
                              productSizeController.text,
                              id,
                              double.parse(productPriceController.text),
                            ),
                          );
                      productNameController.clear();
                      productPriceController.clear();
                      productSizeController.clear();
                      // ignore: invalid_use_of_visible_for_testing_member
                      context.read<ProductsBloc>().emit(state);
                      Navigator.of(context).pop();
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
              );
            },
          ),
        ],
      ),
    );
  }
}
