// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/products/products_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';

import '../../../../common/enums/bloc_status.dart';
import '../wigets/products_diolog_widget.dart';
import '../wigets/products_grid_view_widget.dart';

// ignore: must_be_immutable
class ProductsPage extends StatefulWidget {
  String productsCategoriesName;
  int id;
  ProductsPage({
    Key? key,
    required this.productsCategoriesName,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productSizeController = TextEditingController();
  int? idWarehouse = 0;

  List<String> dropListValue = ["Item1", "item2", "Item3"];
  List<BranchModel> dropCategory = [];

  Map<int, String> result = {};

  String? dropValue = "";

  @override
  void initState() {
    super.initState();
    context.read<WarehouseBloc>().add(const WarehouseEvent());
    if (context.read<WarehouseBloc>().state.branchNames == null ||
        context.read<WarehouseBloc>().state.branchNames!.isEmpty) {
      dropValue = dropListValue[0];
    } else {
      dropValue = context.read<WarehouseBloc>().state.branchNames?[0];
    }
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<WarehouseBloc, WarehouseState>(
            listener: (context, state) {
              if (state.statusGetWarehouse == BlocStatus.completed) {
                dropValue = context.read<WarehouseBloc>().state.branchNames?[0];
                context.read<ProductsBloc>().add(
                      ProductsEvent(
                        widget.id,
                        state
                            .branchList?[state.branchNames!.indexWhere(
                          (element) => element.startsWith(dropValue!),
                        )]
                            .id,
                      ),
                    );
              }
            },
            builder: (context, state) {
              if (state.statusGetWarehouse == BlocStatus.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                );
              }
              return Column(
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
                          widget.productsCategoriesName,
                          style: AppTextStyles.body20w4.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        // Container(
                        //   height: 35,
                        //   width: 150,
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     color: AppColors.textColorBlack,
                        //     border: Border.all(color: AppColors.grey, width: 1),
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButton<String>(
                        //       dropdownColor: AppColors.textColorBlack,
                        //       value: dropValue,
                        //       isDense: true,
                        //       style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
                        //       items: (state.branchNames ?? dropListValue)
                        //           .toSet()
                        //           .toList()
                        //           .map<DropdownMenuItem<String>>((String value) {
                        //         return DropdownMenuItem<String>(
                        //           value: value,
                        //           child: Text(
                        //             value,
                        //             style: AppTextStyles.body13w4.copyWith(
                        //               color: AppColors.white,
                        //             ),
                        //           ),
                        //         );
                        //       }).toList(),
                        //       isExpanded: true,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           dropValue = value!;
                        //         });
                        //         log("${state.branchList?[state.branchNames!.indexWhere(
                        //           (element) => element.startsWith(dropValue!),
                        //         )].id}");
                        //         context.read<ProductsBloc>().add(
                        //               ProductsEvent(
                        //                 widget.id,
                        //                 state
                        //                     .branchList?[state.branchNames!.indexWhere(
                        //                   (element) => element.startsWith(dropValue!),
                        //                 )]
                        //                     .id,
                        //               ),
                        //             );
                        //         setState(() {
                        //           idWarehouse = state
                        //               .branchList?[state.branchNames!.indexWhere(
                        //             (element) => element.startsWith(dropValue!),
                        //           )]
                        //               .id;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: ProductsPageGridViewWidget(
                      index: widget.id,
                      idWarehouse: idWarehouse ?? 0,
                      onTap: () {
                        showMyProductsDialog(
                          context,
                          widget.id,
                          idWarehouse!,
                          dropValue!,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
