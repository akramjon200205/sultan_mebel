import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/assets.dart';

class CustomGridViewAddContainerWidget extends StatelessWidget {
  const CustomGridViewAddContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.textColorBlack,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: SvgPicture.asset(
        Assets.icons.plusIcon,
        alignment: Alignment.center,
        width: 50,
        height: 50,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
