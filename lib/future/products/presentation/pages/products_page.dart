// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/products_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/wigets/products_grid_view_widget.dart';

import '../../../../common/enums/bloc_status.dart';
import '../../../home/presentation/bloc/home_bloc.dart';

// ignore: must_be_immutable
class ProductsPage extends StatefulWidget {
  String productsCategoriesName;
  int index;
  ProductsPage({
    Key? key,
    required this.productsCategoriesName,
    required this.index,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productSizeController = TextEditingController();

  List<CategoryModel> dropCategory = [];
  List<String> dropListValue = [];
  List<Products> productList = [];

  Map<int, String> result = {};

  String? dropValue = "";
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
      dropValue = result[widget.index + 1] ?? ''; // Adjust index if necessary
      dropValue1 = result[widget.index + 1] ?? ''; // Adjust index if necessary
    } else {
      // Handle the case where widget.index is out of range
      dropValue = ''; // Set to a default value or handle accordingly
      dropValue1 = ''; // Set to a default value or handle accordingly
    }
  }

  int findIdByName(String name, Map<int, String> map) {
    for (var entry in map.entries) {
      if (entry.value == name) {
        return entry.key;
      }
    }
    return 0; // Return -1 or any value indicating that the name was not found
  }

  @override
  void initState() {
    super.initState();
    getCategories(context);
  }

  Future<void> showMyProductsDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Dialog(
              backgroundColor: AppColors.textColorBlack,
              alignment: Alignment.topCenter,
              insetPadding: const EdgeInsets.symmetric(horizontal: 25),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDialogTextFieldContainer(
                      textFieldName: "Maxsulot nomi",
                      hintTextTextField: "Input something",
                      controller: productNameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDialogTextFieldContainer(
                      textFieldName: "Narx",
                      hintTextTextField: "Input something",
                      controller: productPriceController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDialogTextFieldContainer(
                      textFieldName: "O'lcham",
                      hintTextTextField: "Input something",
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
                        BlocConsumer<ProductsBloc, ProductsState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state.statusGetProductCategory == BlocStatus.inProgress ||
                                state.statusGetProductCategory == BlocStatus.inProgress) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              );
                            }
                            return Container(
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
                                    context.read<ProductsBloc>().add(
                                          ProductsEvent(
                                            findIdByName(dropValue!, result),
                                          ),
                                        );
                                    // ignore: invalid_use_of_visible_for_testing_member
                                    context.read<ProductsBloc>().emit(state);
                                  },
                                ),
                              ),
                            );
                          },
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
                        Navigator.of(context).pop();
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
                        productNameController.clear();
                        productPriceController.clear();
                        productSizeController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBarWidget(
            arrowBackIcon: true,
          ),
        ),
        body: BlocConsumer<ProductsBloc, ProductsState>(
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

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.productsList?.name ?? '',
                          style: AppTextStyles.body20w4.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Container(
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
                              value: dropValue ?? '',
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
                                dropValue = value!;
                                context.read<ProductsBloc>().add(
                                      ProductsEvent(
                                        findIdByName(dropValue!, result),
                                      ),
                                    );
                                // ignore: invalid_use_of_visible_for_testing_member
                                context.read<ProductsBloc>().emit(state);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: ProductsPageGridViewWidget(
                      index: widget.index,
                      onTap: () {
                        showMyProductsDialog();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
