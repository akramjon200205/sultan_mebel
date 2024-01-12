// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';

// ignore: must_be_immutable
class CustomSalesOrderContainerWidget extends StatelessWidget {
  Widget child;
  CustomSalesOrderContainerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.greyTextColor,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
