// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_grid_add_container_widget.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/common/routes.dart';
import 'package:sultan_mebel/future/product/presentation/bloc/product_bloc.dart';

import '../bloc/products/products_bloc.dart';

// ignore: must_be_immutable
class ProductsPageGridViewWidget extends StatefulWidget {
  final Function()? onTap;
  final int idCategory;
  final int idWarehouse;
  const ProductsPageGridViewWidget({
    Key? key,
    required this.onTap,
    required this.idCategory,
    required this.idWarehouse,
  }) : super(key: key);

  @override
  State<ProductsPageGridViewWidget> createState() => _ProductsPageGridViewWidgetState();
}

class _ProductsPageGridViewWidgetState extends State<ProductsPageGridViewWidget> {
  int? amount;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (context.read<ProductBloc>().state.putAmount == BlocStatus.completed) {
          log("${context.read<ProductBloc>().state.putAmount}");
        }
      },
      builder: (context, state) {
        if (state.statusGetProductCategory == BlocStatus.inProgress ||
            state.statusPostProductCategory == BlocStatus.inProgress) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.symmetric().copyWith(bottom: 30),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: (state.productsList?.length ?? 0) + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            if (index != (state.productsList?.length ?? 0)) {
              return InkWell(
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.transparent,
                onTap: () {
                  amount = state.productsList?[index].id;
                  Navigator.of(context).pushNamed(Routes.productPage, arguments: {
                    'idProduct': state.productsList![index].product?.id,
                    'idCategory': widget.idCategory,
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.textColorBlack,
                    border: Border.all(width: 1, color: AppColors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Divider(
                        color: AppColors.grey,
                        height: 2,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.productsList?[index].product?.name ?? '',
                              style: AppTextStyles.body13w4.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "${state.productsList?[index].amount ?? 0}",
                              style: AppTextStyles.body16w5.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return InkWell(
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(15),
                child: const CustomGridViewAddContainerWidget(),
              );
            }
          },
        );
      },
    );
  }
}
