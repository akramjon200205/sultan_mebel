// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sultan_mebel/common/app_colors.dart';

class CustomAppBarActionWidget extends StatelessWidget {
  String iconTextAssets;
  Function function;
  CustomAppBarActionWidget({
    Key? key,
    required this.iconTextAssets,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      // borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 30,
        height: 30,
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
    );
  }
}
