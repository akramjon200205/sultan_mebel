// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sultan_mebel/common/app_colors.dart';

class CustomAppBarActionWidget extends StatelessWidget {
  String iconTextAssets;
  Function function;
  EdgeInsets margin;
  CustomAppBarActionWidget({
    Key? key,
    required this.iconTextAssets,
    required this.function,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: () => function(),
        child: Container(
          width: 30,
          height: 30,
          // margin: margin,
          padding: const EdgeInsets.symmetric(horizontal: 7),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.yellow,
          ),
          child: SvgPicture.asset(
            iconTextAssets,
            color: AppColors.textColorDark,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
