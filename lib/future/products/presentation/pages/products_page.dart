// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/products_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/wigets/products_grid_view_widget.dart';

import '../../../../common/enums/bloc_status.dart';
import '../wigets/find_by_id_name.dart';
import '../wigets/products_diolog_widget.dart';

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

  Map<int, String> result = {};

  String? dropValue = "";

  @override
  void initState() {
    super.initState();
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
                        showMyProductsDialog(context, widget.index);
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
