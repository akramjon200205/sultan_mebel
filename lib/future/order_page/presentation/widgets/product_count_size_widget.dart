// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/sales_order_container_widget.dart';

class ProductCountSizeWidget extends StatelessWidget {
  const ProductCountSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSalesOrderContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Mahsulotlar",
            style: AppTextStyles.body18w5.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: AppColors.greyTextColor,
              thickness: 1.5,
              height: 1.5,
              indent: 0,
              endIndent: 0,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              itemBuilder: (context, index) {
                return ProductSizes(
                  index: index,
                  count: 1,
                  productName: "Product 1",
                  productSize: "100*127*127",
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductSizes extends StatelessWidget {
  int index;
  int count;
  String productName;
  String productSize;
  ProductSizes({
    Key? key,
    required this.index,
    required this.count,
    required this.productName,
    required this.productSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              index.toString(),
              style: AppTextStyles.body14w3.copyWith(color: AppColors.greyTextColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              productName,
              style: AppTextStyles.body14w3.copyWith(color: AppColors.greyTextColor),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              count.toString(),
              style: AppTextStyles.body14w3.copyWith(color: AppColors.greyTextColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              productSize,
              style: AppTextStyles.body14w3.copyWith(color: AppColors.greyTextColor),
            ),
          ],
        )
      ],
    );
  }
}
